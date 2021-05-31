class User < ApplicationRecord
    has_many :cars
    has_many :cars, through: :rents
    validates :user_name, presence: true, uniqueness: true

end
