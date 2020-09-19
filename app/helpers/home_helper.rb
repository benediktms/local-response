module HomeHelper
  def featured_booking
    @booking = Booking.all
    @random_booking = @bookings.sample(3)
  end
end
