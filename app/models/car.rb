class Car < ApplicationRecord
  belongs_to :user
  validates :model, presence: true
  validates :year, presence: true
  validates :location, presence: true
  validates :km, presence: true
  validates :daily_rate, presence: true

  has_one_attached :picture
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
