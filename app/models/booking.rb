# frozen_string_literal: true

class Booking < ApplicationRecord
  # This is the user who is requesting to do the jobs
  belongs_to :user
  belongs_to :job
  has_many :reviews
  has_many_attached :invoices
  has_one :chatroom, dependent: :destroy
end
