# frozen_string_literal: true

class Job < ApplicationRecord
  # This user is the person who created the job
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  belongs_to :category
  has_many :bookings
end
