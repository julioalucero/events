require 'rails_helper'

RSpec.describe Search, type: :model do
  it { should validate_presence_of(:metadata) }
  it { should validate_presence_of(:user_id) }
end
