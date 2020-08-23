class RemovePendingFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :pending
  end
end
