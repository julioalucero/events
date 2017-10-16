require 'spec_helper'
require 'cable_helpers'

describe CableHelpers do
  describe '#user_is_connected?' do
    let(:user_id) { 1 }

    context 'when the user is logged' do
      before do
        expect_any_instance_of(Redis)
          .to receive(:pubsub)
          .and_return(['action_cable/Z2lkOi8vZXZlbnRzL1VzZXIvMQ'])
      end

      it 'returns true' do
        expect(CableHelpers.user_is_connected?(user_id)).to be_truthy
      end
    end

    context 'when the user is logged but with different id' do
      before do
        expect_any_instance_of(Redis)
          .to receive(:pubsub)
          .and_return(['action_cable/Z2lkOi8vZXZlbnRzL1VzZXIvMw'])
      end

      it 'returns true' do
        expect(CableHelpers.user_is_connected?(user_id)).to be_falsy
      end
    end

    context 'when the user is not logged' do
      before do
        expect_any_instance_of(Redis)
          .to receive(:pubsub)
          .and_return([])
      end

      it 'returns false' do
        expect(CableHelpers.user_is_connected?(user_id)).to be_falsy
      end
    end
  end
end
