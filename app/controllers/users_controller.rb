class UsersController < ApplicationController
  def book
# current_user.flights = params[:flight]
current_user.flights << Flight.find(params[:flight])

ActionCable.server.broadcast 'flight_update_channel', content: @submitted_flight, username: current_user, method: 'booked'
    # current_user.update(flight_id: params[:flight])
    # Passenger.create({firstname: current_user.name, flight_id: params[:flight]})
    # x = Flight.find(params[:flight]).num_passenger
    # Flight.find(params[:flight]).update(num_passenger: x + 1)
    # current_user.flight = Flight.find(params[:flight])
    # current_user.save
    flash[:notice] = "Flight ##{params[:flight]} booked!"
    # render html:'hhi'
redirect_to flights_path
end
end
