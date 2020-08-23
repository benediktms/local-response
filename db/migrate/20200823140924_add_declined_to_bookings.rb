class AddDeclinedToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :declined, :boolean
  end
end
