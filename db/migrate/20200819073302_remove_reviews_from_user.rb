class RemoveReviewsFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :job_review
    remove_column :users, :booking_review
  end
end
