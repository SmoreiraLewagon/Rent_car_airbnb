class Car < ApplicationRecord
  belongs_to :user
  validates :model, presence: true
  validates :year, presence: true
  validates :location, presence: true
  validates :km, presence: true
  # validates :daily_rate, presence: true

  has_one_attached :picture
  has_many :rents

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  include PgSearch::Model
  pg_search_scope :search_by_model_and_year_and_location,
    against: [ :model, :year, :location ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
