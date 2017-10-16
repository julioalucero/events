class EventBroadcastWorker
  include Sidekiq::Worker

  def perform(event_id)
    event = Event.find(event_id)

    Matches::SearchEvent.new(event).process
  end
end
