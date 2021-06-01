class Car < ApplicationRecord
  belongs_to :user
  validates :model, presence: true
  validates :year, presence: true
  validates :location, presence: true
  validates :km, presence: true
end
