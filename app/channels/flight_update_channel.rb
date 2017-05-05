class FlightUpdateChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "flight_update_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
