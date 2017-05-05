class UsersController < ApplicationController
<<<<<<< HEAD
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
=======
  before_action :authenticate_user!

  def book
    # current_user.flights = params[:id]
    booked_flight = Flight.find(params[:id])

    if booked_flight
      current_user.flights << booked_flight
      gon.current_user = current_user
      ActionCable.server.broadcast 'flight_update_channel',
                                    content: booked_flight,
                                    user: current_user,
                                    method: 'book'
    end

    # flash[:notice] = "Congrats! You've booked Flight##{booked_flight.id} from #{booked_flight.from} to #{booked_flight.to}"
    # redirect_to flights_path
  end
>>>>>>> 6955510e167eee35253b04994a7c71176cb8a58d
end
