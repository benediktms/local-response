import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
// import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

import { addMarkersToMap } from './add_markers';
import { fitMapToMarkers } from './fit_markers';
import { getRoute } from './get_route';

export const initMapbox = () => {
  const mapElement = document.getElementById('map');

  // only build a map if there's a div#map to inject into
  if (mapElement) {
    // checcking if routing is allowed
    const routing = Boolean(mapElement.dataset.route == 'true');
    const search = Boolean(mapElement.dataset.search == 'true');
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v11',
    });

    const markers = JSON.parse(mapElement.dataset.markers);

    markers.forEach((marker) => {
      new mapboxgl.Marker().setLngLat([marker.long, marker.lat]).addTo(map);
    });

    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);

    // if routing is permitted, get the route
    if (routing) {
      getRoute(map, markers, mapboxgl.accessToken);
    }

    // condition to add the search bar to the map
    if (!routing && search) {
      console.log('search true');
      map.addControl(
        new MapboxGeocoder({
          accessToken: mapboxgl.accessToken,
          mapboxgl: mapboxgl,
        })
      );
    }
    map.on('wheel', (event) => {
      if (event.originalEvent.ctrlKey) {
        return;
      }
      if (event.originalEvent.metaKey) {
        return;
      }
      if (event.originalEvent.altKey) {
        return;
      }
      event.preventDefault();
    });
  }
};
