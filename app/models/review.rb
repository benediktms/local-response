class Review < ApplicationRecord
  # belongs_to :reviewable, polymorphic: true
  belongs_to :booking
  belongs_to :user
end
