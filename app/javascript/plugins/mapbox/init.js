import mapboxgl from 'mapbox-gl';
import { addMarkersToMap } from './add_markers';
import { fitMapToMarkers } from './fit_markers';
import { getRoute } from './route/get_route';

const initMapbox = async () => {
  const mapElement = document.getElementById('map');

  // only build a map if there's a div#map to inject into
  if (mapElement) {
    // declaring api key to pass to the getRoute function
    const apiKey = mapElement.dataset.mapboxApiKey;
    mapboxgl.accessToken = apiKey;
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
    await getRoute(map, markers, apiKey);
  }
};

export { initMapbox };
