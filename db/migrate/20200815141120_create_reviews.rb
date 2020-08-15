class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :booking, null: false, foreign_key: true
      t.integer :rating
      t.string :title
      t.string :description
      t.boolean :tasker

      t.timestamps
    end
  end
end
