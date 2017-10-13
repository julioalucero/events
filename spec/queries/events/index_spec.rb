require 'rails_helper'

RSpec.describe Queries::Events::Index do
  describe '#find' do
    let(:args) { {} }

    subject { described_class.new(args) }

    describe 'the base query' do
      let!(:events) { create_list(:event, 5) }

      it 'returns unfiltered data' do
        expect(subject.find.length).to eq(5)
      end
    end

    describe 'by_city' do
      let!(:event_1) { create(:event) }
      let!(:event_2) { create(:event) }

      context 'given a filter by the first city' do
        let(:args) { { city: event_1.location.city } }

        it 'returns only the given city events' do
          expect(subject.find).to match_array([event_1])
        end
      end
    end

    describe 'by_topic' do
      let!(:event_1) { create(:event, topics: [Enums::Topics::BAR, Enums::Topics::MUSIC]) }
      let!(:event_2) { create(:event, topics: [Enums::Topics::ART, Enums::Topics::OTHER]) }

      context 'given a filter by one topic' do
        let(:args) { { topic: Enums::Topics::BAR } }

        it 'returns only the given topic events' do
          expect(subject.find).to match_array([event_1])
        end
      end
    end

    describe 'by_date_range' do
      let!(:event_1) { create(:event, date: Date.today) }
      let!(:event_2) { create(:event, date: Date.today + 1.month) }

      context 'given a filter by start and end date' do
        let(:args) { { start_date: Date.today - 1.day, end_date: Date.today + 1.day } }

        it 'returns only the events between these dates' do
          expect(subject.find).to match_array([event_1])
        end
      end
    end
  end
end
