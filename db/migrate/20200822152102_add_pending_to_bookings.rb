class AddPendingToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :pending, :boolean
  end
end
