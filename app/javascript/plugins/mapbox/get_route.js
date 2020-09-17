import { addDirections } from './add_directions';

export const getRoute = async (map, coordinates, apiKey) => {
  const startCoords = [coordinates[0].long, coordinates[0].lat];
  const endCoords = [coordinates[1].long, coordinates[1].lat];

  const url =
    'https://api.mapbox.com/directions/v5/mapbox/walking/' +
    `${startCoords[0]},${startCoords[1]};` +
    `${endCoords[0]},${endCoords[1]}` +
    '?steps=true&geometries=geojson&access_token=' +
    `${apiKey}`;

  const response = await fetch(url);
  const data = await response.json();
  const route = data.routes[0].geometry.coordinates;

  if (!response.ok) {
    throw new Error(response.error);
  } else {
    addDirections(data);
    // if the route already exists on the map, reset it using setData
    if (map.getSource('route')) {
      console.log('set route data');
      map.getSource('route').setData(route);
    } else {
      // otherwise, make a new request
      console.log('adding route map layer');
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
              coordinates: route,
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

    if (map.getLayer('start')) {
      console.log('set data start');
      map.getSource('start').setData(startCoords);
    } else {
      console.log('adding start point map layer');
      map.addLayer({
        id: 'start',
        type: 'circle',
        source: {
          type: 'geojson',
          data: {
            type: 'FeatureCollection',
            features: [
              {
                type: 'Feature',
                properties: {},
                geometry: {
                  type: 'Point',
                  coordinates: startCoords,
                },
              },
            ],
          },
        },
        paint: {
          'circle-radius': 10,
          'circle-color': '#3887be',
        },
      });
    }

    if (map.getLayer('end')) {
      console.log('set data end');
      map.getSource('end').setData(endCoords);
    } else {
      console.log('adding end point map layer');
      map.addLayer({
        id: 'end',
        type: 'circle',
        source: {
          type: 'geojson',
          data: {
            type: 'FeatureCollection',
            features: [
              {
                type: 'Feature',
                properties: {},
                geometry: {
                  type: 'Point',
                  coordinates: endCoords,
                },
              },
            ],
          },
        },
        paint: {
          'circle-radius': 10,
          'circle-color': '#f30',
        },
      });
    }
  }
};
