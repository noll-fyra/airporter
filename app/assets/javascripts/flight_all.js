$(document).on('ready page:load', function () {
  if($('#all-flight').length) {
    console.log('run specific js file for all flight page')
    gon.flights.forEach(function(data) {
      console.log(JSON.stringify(data))
    })
  }
})
