class FlightsController < ApplicationController
<<<<<<< HEAD
  before_action :get_flight, only: [:show, :edit, :update, :destroy]
=======
>>>>>>> 6955510e167eee35253b04994a7c71176cb8a58d
  before_action :authenticate_user!, except: [:index]

  def index
    @all_flights = Flight.all
    #set new flight for form
    @new_flight = Flight.new

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

<<<<<<< HEAD
=======
    # @all_passengers = @individual_flight.passengers
>>>>>>> 6955510e167eee35253b04994a7c71176cb8a58d
  end

  def edit
    @individual_flight = Flight.find(params[:id])
  end

  def new
    @new_flight = Flight.new
  end

  # RECEIVING A POST REQUEST TO CREATE
  def create
    @submitted_flight = Flight.new(filter_params)
    if @submitted_flight.save
<<<<<<< HEAD

    ActionCable.server.broadcast 'flight_update_channel', content: @submitted_flight, username: current_user, method: 'create'
  end
    redirect_to flights_path
=======
      # ActionCable.server.broadcast(<stream>, <messages>)
      ActionCable.server.broadcast 'flight_update_channel',
                                    content: @submitted_flight,
                                    user: current_user,
                                    method: 'create'

      # dont need to redirect_to flights_path anymore
    end


>>>>>>> 6955510e167eee35253b04994a7c71176cb8a58d
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

  private

  def get_flight
    @individual_flight = Flight.find(params[:id])
  end

  def flight_params
    params.require(:flight).permit(:to, :from, :airline, :num_passenger)
  end
end
