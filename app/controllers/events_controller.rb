class EventsController < ApplicationController
  helper_method :search_params

  PERMITED_PARAMS = [:title, :date, :start_at, :end_at, topics: [], location_attributes: [:city]].freeze
  SEARCH_PARAMS = [:city, :topic, :start_date, :end_date, :start_at, :end_at].freeze

  def index
    @events = Queries::Events::Index.new(search_params).find
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    @event.build_location
  end

  def create
    binding.pry
    @event = Event.new(event_params)

    if @event.save
      message = { notice: t('event.created') }
    else
      message = { alert: t('event.failed') }
    end

    redirect_to event_params(@event), message
  end

  private

  def search_params
    params.permit(SEARCH_PARAMS)
  end

  def event_params
    params.require(:event).permit(PERMITED_PARAMS)
  end
end
