require 'rails_helper'

RSpec.describe Search, type: :model do
  it { should validate_presence_of(:metadata) }
  it { should validate_presence_of(:user_id) }

  describe '#match_event?' do
    let(:date) { Date.new(2017, 03, 05) }
    let(:search) { create(:search, metadata: { start_date: '2017-03-02', end_date: '2017-03-10' }) }

    context 'when a event match with the search' do
      let(:event) { create(:event, date: date ) }

      it 'returns true' do
        expect(search.match_event?(event)).to be_truthy
      end
    end

    context 'when a event does not match with the search' do
      let(:event) { create(:event, date: Date.new(2010, 12, 5) ) }

      it 'returns false' do
        expect(search.match_event?(event)).to be_falsy
      end
    end
  end
end
