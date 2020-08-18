class AddUserToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :user_id, :integer
      t.references :booking, null: false, foreign_key: true
  end
end
