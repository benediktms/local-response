import mapboxgl from 'mapbox-gl';
import { addMarkersToMap } from './add_markers_mapbox';
import { fitMapToMarkers } from './fit_markers_mapbox';
import { getRoute } from './add_route_mapbox';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) {
    // only build a map if there's a div#map to inject into
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
    getRoute(map, markers, apiKey);
  }
};

export { initMapbox };
