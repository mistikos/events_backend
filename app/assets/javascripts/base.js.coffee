$ ->
  #menu dropdown
  $('.dropdown-toggle').dropdown()

  #tooltip
  $('.tipsy-add').tipsy()

  #add map
  options =
    map: '#my_map'
    location: 'LIM'
    details: '.location_event'
    detailsAttribute: "data-geo"

  $('input.location').geocomplete options