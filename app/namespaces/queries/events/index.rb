module Queries
  module Events
    class Index
      def initialize(args = {})
        @klass = ::Event
        @city = args[:city]
        @topic = args[:topic]
      end

      attr_reader :klass,
                  :city,
                  :topic

      def find
        build_query
      end

      private

      def build_query
        relation = klass.all

        relation = by_city(relation) if city.present?
        relation = by_topic(relation) if topic.present?

        relation
      end

      def by_city(relation)
        relation.includes(:location).where(locations: { city: city })
      end

      def by_topic(relation)
        relation.where('topics ilike ?', "%\n- #{topic}\n%")
      end
    end
  end
end
