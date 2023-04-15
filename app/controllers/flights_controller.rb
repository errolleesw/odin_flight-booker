class FlightsController < ApplicationController
  before_action :set_flight, only: %i[show edit update destroy]
  # helper_method :unique_departure_dates
  # GET /flights or /flights.json
  # def index
  #   @flights = Flight.all
  #   @flights = @flights.joins(:origin).where('origins.name ILIKE ?', "%#{params[:from]}%") if params[:from].present?
  #   @flights = @flights.where(destination: params[:to]) if params[:to].present?
  #   @flights = @flights.where('departure_time > ?', params[:departure_time]) if params[:departure_time].present?
  #   @flights = @flights.where('arrival_time < ?', params[:arrival_time]) if params[:arrival_time].present?
  #   @flights = @flights.where('duration < ?', params[:duration]) if params[:duration].present?
  # end

  def index
    # get the unique departure dates from the flight model and uses it as options in the select tag
    @unique_departure_dates = Flight.pluck(:departure_time).map { |datetime| datetime.to_date }.uniq.sort

    # The joins part of the query creates an SQL INNER JOIN between flights and airports on origin_id and destination_id
    # The includes part of the query performs eager loading for the :airline, :origin, and :destination associations. So you can featch all the assoicated records in a single query.
    @flights = Flight.joins(:origin, :destination).includes(:airline, :origin, :destination)

    # if params[:from].present?
    #   @flights = @flights.joins(:origin).where('origins_flights.name ILIKE ?',
    #                                            "%#{params[:from]}%")
    # end

    @flights = @flights.where('airports.name ILIKE ?', "%#{params[:from]}%") if params[:from].present?

    # return unless params[:to].present?

    # return unless params[:to].present?
    if params[:to].present?
      # another .joins(:destination) is added before the .where clause to create an alias for the airports table. This is necessary because both :origin and :destination associaitons references the same table and using an alias helps to avoid ambiguity.
      @flights = @flights.joins(:destination).where('destinations_flights.name ILIKE ?',
                                                    "%#{params[:to]}%")
    end

    return unless params[:date].present?

    @flights = @flights.where(departure_time: params[:date].to_date.beginning_of_day..params[:date].to_date.end_of_day)
  end

  # GET /flights/1 or /flights/1.json
  def show; end

  # GET /flights/new
  def new
    @flight = Flight.new
  end

  # GET /flights/1/edit
  def edit; end

  # POST /flights or /flights.json
  def create
    @flight = Flight.new(flight_params)

    respond_to do |format|
      if @flight.save
        format.html { redirect_to flight_url(@flight), notice: 'Flight was successfully created.' }
        format.json { render :show, status: :created, location: @flight }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flights/1 or /flights/1.json
  def update
    respond_to do |format|
      if @flight.update(flight_params)
        format.html { redirect_to flight_url(@flight), notice: 'Flight was successfully updated.' }
        format.json { render :show, status: :ok, location: @flight }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flights/1 or /flights/1.json
  def destroy
    @flight.destroy

    respond_to do |format|
      format.html { redirect_to flights_url, notice: 'Flight was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # this method extract unique flight dates from the database and sort them in ascending order. This is used the the drop down menu on the flights search form.
  # def unique_departure_dates
  #   @unique_departure_dates = Flight.pluck(:departure_time).map { |datetime| datetime.to_date }.uniq.sort
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_flight
    @flight = Flight.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def flight_params
    params.require(:flight).permit(:flight_number, :airline_id, :origin_id, :destination_id, :departure_time,
                                   :arrival_time, :duration)
  end
end
