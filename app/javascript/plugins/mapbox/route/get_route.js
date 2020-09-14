export const getRoute = async (map, coordinates, apiKey) => {
  const url =
    'https://api.mapbox.com/directions/v5/mapbox/walking/' +
    `${coordinates[0].lat},${coordinates[0].long}` +
    ';' +
    `${coordinates[1].lat},${coordinates[1].long}` +
    '?steps=true&geometries=geojson&access_token=' +
    `${apiKey}`;

  const response = await fetch(url);
  if (response.ok) {
    const data = await response.json();
    const route = data.routes[0].geometry.coordinates;
    console.log(coordinates);
    const geojson = {
      type: 'Feature',
      properties: {},
      geometry: {
        type: 'LineString',
        coordinates: route,
      },
    };

    // if the route already exists on the map, reset it using setData
    if (map.getSource('route')) {
      map.getSource('route').setData(geojson);
    } else {
      // otherwise, make a new request
      console.log('adding map layer');
      map.addLayer({
        id: 'route',
        type: 'line',
        source: {
          type: 'geojson',
          data: {
            type: 'Feature',
            properties: {},
            geometry: {
              type: 'LineString',
              coordinates: geojson,
            },
          },
        },
        layout: {
          'line-join': 'round',
          'line-cap': 'round',
        },
        paint: {
          'line-color': '#3887be',
          'line-width': 5,
          'line-opacity': 0.75,
        },
      });
    }
  } else {
    throw new Error(response.error);
  }
};
