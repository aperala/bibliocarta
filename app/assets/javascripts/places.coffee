$ -> 
  L.mapbox.accessToken = 'pk.eyJ1IjoiYW5pdGFwIiwiYSI6ImU3ZGNjYTg0OGFlODAzNzRmZWRkNjQ0NDQzOGExZDJhIn0.guLXPMbKlm5LoUZXIKkmcw'
  map = L.mapbox.map('map', 'anitap.n7n00g62', -> (console.log("loaded")))
  window.map = map
  console.log(map.success)
  map.setView([40.7126, 74.0059], 2)

  addLayer = (geojson) ->
    ->
     map.featureLayer.setGeoJSON(geojson)

  $.getJSON '/places.json', (data) ->
      geojson = (data)
      console.log geojson
      setTimeout(addLayer(geojson), 300)

  map.featureLayer.on 'layeradd', (e) ->
    marker = e.layer
    properties = marker.feature.properties

    popupContent = '<div class="popup">' +
                      '<h4>' + properties.name + '</h4>' +
                      '<p>' + properties.books + ' books</p>' +
                    '</div>'

    marker.bindPopup popupContent,
      closeButton: false
      minWidth: 320
