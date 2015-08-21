$ -> 
  
    $.getJSON '/places.json', (geojson) ->
      L.mapbox.accessToken = 'pk.eyJ1IjoiYW5pdGFwIiwiYSI6ImU3ZGNjYTg0OGFlODAzNzRmZWRkNjQ0NDQzOGExZDJhIn0.guLXPMbKlm5LoUZXIKkmcw'
      map = L.mapbox.map('map', 'anitap.n7n00g62')
                    .setView([40.7126, 74.0059], 2)
                    .featureLayer.setGeoJSON(geojson)
                    .on 'layeradd', (e) ->
                      console.log('no')
                      marker = e.layer
                      properties = marker.feature.properties

                      popupContent = '<div class="popup">' +
                                        '<h4>' + properties.name + '</h4>' +
                                        '<p>' + properties.books + ' books</p>' +
                                      '</div>'

                      marker.bindPopup popupContent,
                        closeButton: false
                        minWidth: 320
