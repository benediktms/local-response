class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :title
      t.string :description
      t.string :address
      t.datetime :due_date
      t.integer :start_time
      t.integer :end_time
      t.float :longitude
      t.float :latitude
      t.float :price

      t.timestamps
    end
  end
end
