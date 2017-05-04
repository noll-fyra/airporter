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

    @all_passengers = @individual_flight.passengers
  end

  def edit
    @individual_flight = Flight.find(params[:id])
  end

  def new
    @new_flight = Flight.new
  end

  # RECEIVING A POST REQUEST TO CREATE
  def create
    # @submitted_flight = params[:flight]
    # Rails Console Way
    # @saved_flight = Flight.new
    # @saved_flight.from = @submitted_flight[:from]
    # @saved_flight.to = @submitted_flight[:to]

    # Mass Assignment Way - can't do this
    @submitted_flight = Flight.new(filter_params)
    @submitted_flight.save
    redirect_to flight_path(@submitted_flight)
  end

  # RECEIVING A PUT/PATCH REQUEST TO UPDATE
  # put request from this url
  # /flights/:id/edit
  def update
    @updated_flight = Flight.find(params[:id])
    if @updated_flight.update(filter_params) # if this update is successful
      redirect_to flights_path
    end
  end

  # HANDLE A DELETE REQUEST
  def destroy
    @deleted_flight = Flight.find(params[:id])
    @deleted_flight.destroy

    redirect_to flights_path
  end

  private

  # filter method called by create and update
  def filter_params
    params.require(:flight).permit(:from, :to, :airline, :num_passenger)
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
