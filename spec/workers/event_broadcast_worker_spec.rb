require 'rails_helper'

RSpec.describe EventBroadcastWorker, type: :worker do
  describe '#perform' do
    let(:event) { create(:event) }

    it 'call to process Matches::SearchEvent' do
      expect_any_instance_of(Matches::SearchEvent).to receive(:process)

      described_class.new.perform(event.id)
    end
  end
end
