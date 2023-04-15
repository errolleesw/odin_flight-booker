require "application_system_test_case"

class PassengerBookingsTest < ApplicationSystemTestCase
  setup do
    @passenger_booking = passenger_bookings(:one)
  end

  test "visiting the index" do
    visit passenger_bookings_url
    assert_selector "h1", text: "Passenger bookings"
  end

  test "should create passenger booking" do
    visit passenger_bookings_url
    click_on "New passenger booking"

    fill_in "Booking", with: @passenger_booking.booking_id
    fill_in "Passenger", with: @passenger_booking.passenger_id
    click_on "Create Passenger booking"

    assert_text "Passenger booking was successfully created"
    click_on "Back"
  end

  test "should update Passenger booking" do
    visit passenger_booking_url(@passenger_booking)
    click_on "Edit this passenger booking", match: :first

    fill_in "Booking", with: @passenger_booking.booking_id
    fill_in "Passenger", with: @passenger_booking.passenger_id
    click_on "Update Passenger booking"

    assert_text "Passenger booking was successfully updated"
    click_on "Back"
  end

  test "should destroy Passenger booking" do
    visit passenger_booking_url(@passenger_booking)
    click_on "Destroy this passenger booking", match: :first

    assert_text "Passenger booking was successfully destroyed"
  end
end
