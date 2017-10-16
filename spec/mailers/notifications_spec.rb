require "rails_helper"

RSpec.describe NotificationsMailer, type: :mailer do
  describe "match_event" do
    let(:event) { create(:event) }
    let(:user) { create(:user) }
    let(:mail) { NotificationsMailer.match_event(event, user.id) }

    it "renders the headers" do
      expect(mail.subject).to eq('A new event match with you search')
      expect(mail.to).to eq([user.email])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match('A new event match with you search')
    end
  end
end
