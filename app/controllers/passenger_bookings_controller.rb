class PassengerBookingsController < ApplicationController
  before_action :set_passenger_booking, only: %i[ show edit update destroy ]

  # GET /passenger_bookings or /passenger_bookings.json
  def index
    @passenger_bookings = PassengerBooking.all
  end

  # GET /passenger_bookings/1 or /passenger_bookings/1.json
  def show
  end

  # GET /passenger_bookings/new
  def new
    @passenger_booking = PassengerBooking.new
  end

  # GET /passenger_bookings/1/edit
  def edit
  end

  # POST /passenger_bookings or /passenger_bookings.json
  def create
    @passenger_booking = PassengerBooking.new(passenger_booking_params)

    respond_to do |format|
      if @passenger_booking.save
        # PassengerMailer.with(passenger: @passenger_booking.passenger).welcome_email.deliver_now
        format.html { redirect_to passenger_booking_url(@passenger_booking), notice: "Passenger booking was successfully created." }
        format.json { render :show, status: :created, location: @passenger_booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @passenger_booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /passenger_bookings/1 or /passenger_bookings/1.json
  def update
    respond_to do |format|
      if @passenger_booking.update(passenger_booking_params)
        format.html { redirect_to passenger_booking_url(@passenger_booking), notice: "Passenger booking was successfully updated." }
        format.json { render :show, status: :ok, location: @passenger_booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @passenger_booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /passenger_bookings/1 or /passenger_bookings/1.json
  def destroy
    @passenger_booking.destroy

    respond_to do |format|
      format.html { redirect_to passenger_bookings_url, notice: "Passenger booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_passenger_booking
      @passenger_booking = PassengerBooking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def passenger_booking_params
      params.require(:passenger_booking).permit(:booking_id, :passenger_id)
    end
end
