import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  const addMarkersToMap = (map, markers) => {
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this

      new mapboxgl.Marker()
        .setLngLat([marker.long, marker.lat])
        .setPopup(popup) // add this
        .addTo(map);
    });
  };

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();

    markers.forEach(marker => bounds.extend([marker.long, marker.lat]));
    map.fitBounds(bounds, { padding: 70 });
    console.log(bounds);
  };

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v11'
    });

    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([marker.long, marker.lat])
        .addTo(map);
    });

    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
  }

};

export { initMapbox };
