import mapboxgl from 'mapbox-gl';

export const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this

    new mapboxgl.Marker()
      .setLngLat([marker.long, marker.lat])
      .setPopup(popup) // add this
      .addTo(map);
  });
};
