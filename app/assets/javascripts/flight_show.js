$(document).on('ready page:load', function () {
  if($('#show-flight').length) {
    console.log('run specific js file for show flight page')
    console.log(JSON.stringify(gon.flight))
  }
})
