class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :jobs
  has_many :bookings
  has_many :user_categories
  has_many :reviews
end
