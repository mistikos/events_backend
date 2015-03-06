$ ->
  $('.dropdown-toggle').dropdown()

  $('.tipsy-add').tipsy()

  $('input.location').geocomplete
    map: '#my_map'
    details: '.location_event'
    detailsAttribute: "data-geo"
    mapOptions:
      zoom: 200
    types: [
      'geocode'
      'establishment'
    ]