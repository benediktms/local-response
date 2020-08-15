class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :job, null: false, foreign_key: true
      t.string :invoice
      t.datetime :confirmed_datetime
      t.boolean :completed
      t.boolean :confirmed

      t.timestamps
    end
  end
end
