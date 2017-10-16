class Search < ApplicationRecord
  belongs_to :user

  serialize :metadata, Hash

  validates :metadata, presence: true
  validates :user_id, presence: true

  def match_event?(event)
    Queries::Events::Index.new(metadata).find.include?(event)
  end
end
