class Location < ApplicationRecord
  has_many :events

  validates :city, presence: true
end
