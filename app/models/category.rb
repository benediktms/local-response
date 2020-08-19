class Category < ApplicationRecord
  has_many :jobs
  has_many :user_categories
end
