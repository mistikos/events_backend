
$ ->
  $('input.location').geocomplete
    map: '#my_map'
    details: '.location_event'
    detailsAttribute: "data-geo"
    types: [
      'geocode'
      'establishment'
    ]
  # $('#find').click ->
  #   $('#geocomplete').trigger 'geocode'


  # $("input.location").geocomplete
  #   details: ".location_event"
  #   location: "LIM"
  #   detailsAttribute: "data-geo"
  #   mapOptions:
  #     zoom: 200
  #   # markerOptions:
  #   #   draggable: true
  #   map: "#my_map"

  # $('input.location').bind 'geocode:dragged', (event, latLng) ->
  #   $('input[name=\'event[longitude]\']').val latLng.lat()
  #   $('input[name=\'event[latitude]\'').val latLng.lng()