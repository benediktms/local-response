module HomeHelper
  def featured_booking
    @booking = Booking.all
    @completed_booking = @bookings.sample(3)
  end
end
