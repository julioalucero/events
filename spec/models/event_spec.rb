require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:event_attrs) { attributes_for(:event) }

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:date) }
    it { should validate_numericality_of (:start_at) }
    it { should validate_numericality_of (:end_at) }

    context 'when an invalid topic' do
      before { event_attrs[:topics] = ['invalid'] }

      it 'adds an error for topics' do
        event = Event.create(event_attrs)

        expect(event.errors).to include(:topics)
      end
    end

    describe '#start_at_before_end_at' do
      before { event_attrs[:end_at] = event_attrs[:start_at] - 1 }

      it 'adds an error on end_at' do
        event = Event.create(event_attrs)

        expect(event.errors).to include(:end_at)
      end
    end
  end

  describe '#save' do
    let(:event) { build(:event) }

    describe 'EventBroadcastWorker' do
      it 'is called' do
        expect(EventBroadcastWorker).to receive(:perform_async)

        event.save
      end
    end
  end
end
