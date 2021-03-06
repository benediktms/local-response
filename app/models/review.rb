# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :user

  validates :description, presence: true
end
