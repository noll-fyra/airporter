class FlightsController < ApplicationController
  before_action :get_flight, only: [:show, :edit, :update, :destroy]

  def index
    @all_flights = Flight.all
    gon.flights = Flight.all
  end

  def create
    @flight = Flight.new(flight_params)
    if @flight.save
      redirect_to flights_path
    else
      render :new
    end
  end

  def new
    @flight = Flight.new
  end

  def show
    # find flight by id
    # @individual_flight = Flight.find(params[:id])
    # pass the data into your js
    gon.flight = @individual_flight
    # alert the data into the screen
  end

  def edit
  end

  def update
    if @individual_flight.update(flight_params)
      redirect_to flight_path(@individual_flight)
    else
      render :edit
    end
  end

  def destroy
    @individual_flight.destroy
      redirect_to flights_path
  end

  private

  def get_flight
    @individual_flight = Flight.find(params[:id])
  end

  def flight_params
    params.require(:flight).permit(:to, :from, :airline, :num_passenger)
  end
end
