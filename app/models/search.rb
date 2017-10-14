class Search < ApplicationRecord
  belongs_to :user

  serialize :metadata, Hash

  validates :metadata, presence: true
  validates :user_id, presence: true
end
