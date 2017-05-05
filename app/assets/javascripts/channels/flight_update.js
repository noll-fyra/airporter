App.flight_update = App.cable.subscriptions.create("FlightUpdateChannel", {
  connected: function() {
  },
  disconnected: function() {
  },
  received: function(data) {
    return alert(JSON.stringify(data))
  }
})
