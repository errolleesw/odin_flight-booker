require 'test_helper'

class PassengerMailerTest < ActionMailer::TestCase
  test "booking confirmation email is sent" do
    # Create a new passenger booking
    passenger = Passenger.create(name: "John Doe", email: "john@example.com")
    booking = Booking.create(passenger: passenger, flight: Flight.first)

    # Call the PassengerMailer and assert that it is called with the correct arguments
    assert_emails 1 do
      PassengerMailer.booking_confirmation(booking).deliver_now
    end

    # Check that the email content is correct
    assert_equal ["john@example.com"], mail.to
    assert_equal "Booking confirmation", mail.subject
    assert_match "Hi John,", mail.body.encoded
  end
end
