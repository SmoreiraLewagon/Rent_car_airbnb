class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :cars
    has_many :rents_as_owner, through: :cars, class_name: "Rent", source: 'rents'
    has_many :rents
    has_many :rented_cars, through: :rents, class_name: 'Car', foreign_key: 'car_id'
    validates :user_name, presence: true, uniqueness: true

end
