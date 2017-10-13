class EventsController < ApplicationController
  helper_method :search_params

  SEARCH_PARAMS = [:city, :topic, :start_date, :end_date, :start_at, :end_at].freeze

  def index
    @events = Queries::Events::Index.new(search_params).find
  end

  private

  def search_params
    params.permit(SEARCH_PARAMS)
  end
end
