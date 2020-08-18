class Booking < ApplicationRecord
  # This is the user who is requesting to do the jobs
  belongs_to :user
  belongs_to :job
  belongs_to :user, through: :job
end
