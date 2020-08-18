class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :jobs
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many :job_bookings, through: :jobs, class_name: :Booking, foregin_key: :job_id
  has_many :job_reviews, through: :job_bookings, class_name: :Review, foreign_key: :booking_id
end
