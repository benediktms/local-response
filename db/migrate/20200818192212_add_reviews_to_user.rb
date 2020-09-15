class AddReviewsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :job_review, :string
    add_column :users, :booking_review, :string
  end
end
