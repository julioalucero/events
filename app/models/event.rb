class Event < ApplicationRecord
  belongs_to :location

  serialize :topics, Array

  validates :topics, array_contents: { contents: Enums::Topics::ALL }
  validates :title, presence: true
  validates :date, presence: true
  validates :start_at, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :end_at, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :start_at_before_end_at

  private

  def start_at_before_end_at
    return true unless end_at && start_at

    if end_at < start_at
      errors.add(:end_at, I18n.t(:start_at_before_end_at))
    end
  end
end
