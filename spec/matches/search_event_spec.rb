require 'rails_helper'

RSpec.describe Matches::SearchEvent do
  describe '#process' do
    let(:event) { create(:event, date: '1017-10-10', start_at: 50, end_at: 100) }

    context 'when a new event matches two searches' do
      let!(:match_search_1) do
        create(:search, metadata: { start_date: '1017-10-05', end_date: '1017-10-15' })
      end
      let!(:match_search_2) do
        create(:search, metadata: { start_at: '00:00', end_date: '01:00' })
      end
      let!(:unmatch_search) do
        create(:search, metadata: { start_at: '00:30', end_at: '00:31' })
      end

      context 'when the user is login' do
        before { allow(CableHelpers).to receive(:user_is_connected?).and_return(true) }

        it 'call to broadcast user channel' do
          expect_any_instance_of(ActionCable::Server::Base).to receive(:broadcast).twice

          described_class.new(event).process
        end
      end

      context 'when the user is not login' do
        before { allow(CableHelpers).to receive(:user_is_connected?).and_return(false) }

        it 'send an email notification' do
          expect(NotificationsMailer).to receive(:match_event).and_call_original.twice

          described_class.new(event).process
        end
      end
    end
  end
end
