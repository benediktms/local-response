class Job < ApplicationRecord
  # This user is the person who created the job
  belongs_to :user
  belongs_to :category
  has_many :bookings
end
