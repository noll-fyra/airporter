class FlightUpdateChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
<<<<<<< HEAD
    stream_from "flight_update_channel"
=======
    stream_from 'flight_update_channel'
>>>>>>> 6955510e167eee35253b04994a7c71176cb8a58d
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
