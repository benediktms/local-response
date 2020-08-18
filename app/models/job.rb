class Job < ApplicationRecord
  # This user is the person who created the job
  belongs_to :user
  belongs_to :category
  belongs_to :booking
  has_many :reviews, through: :bookings, as :reviewable
end
