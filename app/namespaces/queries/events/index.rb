module Queries
  module Events
    class Index
      def initialize(args = {})
        @klass = ::Event
        @city = args[:city]
        @topic = args[:topic]
        @start_date = args[:start_date]
        @end_date = args[:end_date]
        @start_at = parse_time(args[:start_at])
        @end_at = parse_time(args[:end_at])
      end

      attr_reader :klass,
                  :city,
                  :topic,
                  :start_date,
                  :end_date,
                  :start_at,
                  :end_at

      def find
        build_query
      end

      private

      def build_query
        relation = klass.all

        relation = by_city(relation) if city.present?
        relation = by_topic(relation) if topic.present?
        relation = by_date_range(relation) if start_date.present? && end_date.present?
        relation = by_time_range(relation) if start_at.present? && end_at.present?

        relation
      end

      def by_city(relation)
        relation.includes(:location).where(locations: { city: city })
      end

      def by_topic(relation)
        relation.where('topics ilike ?', "%\n- #{topic}\n%")
      end

      def by_date_range(relation)
        relation.where('date >= ? AND date <= ?', start_date, end_date)
      end

      def by_time_range(relation)
        relation.where('start_at >= ? AND end_at <= ?', start_at, end_at)
      end

      def parse_time(time)
        return unless time.present?

        Time.parse(time).seconds_since_midnight
      end
    end
  end
end
