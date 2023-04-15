require "test_helper"

class PassengerBookingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @passenger_booking = passenger_bookings(:one)
  end

  test "should get index" do
    get passenger_bookings_url
    assert_response :success
  end

  test "should get new" do
    get new_passenger_booking_url
    assert_response :success
  end

  test "should create passenger_booking" do
    assert_difference("PassengerBooking.count") do
      post passenger_bookings_url, params: { passenger_booking: { booking_id: @passenger_booking.booking_id, passenger_id: @passenger_booking.passenger_id } }
    end

    assert_redirected_to passenger_booking_url(PassengerBooking.last)
  end

  test "should show passenger_booking" do
    get passenger_booking_url(@passenger_booking)
    assert_response :success
  end

  test "should get edit" do
    get edit_passenger_booking_url(@passenger_booking)
    assert_response :success
  end

  test "should update passenger_booking" do
    patch passenger_booking_url(@passenger_booking), params: { passenger_booking: { booking_id: @passenger_booking.booking_id, passenger_id: @passenger_booking.passenger_id } }
    assert_redirected_to passenger_booking_url(@passenger_booking)
  end

  test "should destroy passenger_booking" do
    assert_difference("PassengerBooking.count", -1) do
      delete passenger_booking_url(@passenger_booking)
    end

    assert_redirected_to passenger_bookings_url
  end
end
