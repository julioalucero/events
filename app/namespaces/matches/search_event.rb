module Matches
  class SearchEvent
    def initialize(event)
      @event = event
      @matches = matches
    end

    attr_reader :event, :matches

    def process
      matches.each do |search|
        if CableHelpers.user_is_connected?(search.user_id)
          ActionCable.server.broadcast("search_#{search.user_id}_channel",
                                       message: render_event)
        else
          NotificationsMailer.match_event(event, search.user_id).deliver_later
        end
      end
    end

    private

    def matches
      Search.all.select { |search| search.match_event?(event) }
    end

    def render_event
      ApplicationController.renderer.render(partial: 'searches/new_match_search',
                                           locals: { event: event })
    end

    def event_args
      event.slice(:date, :start_at, :end_at, :topics)
           .merge(city: event.location.city)
           .symbolize_keys
    end
  end
end
