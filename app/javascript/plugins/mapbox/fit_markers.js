import mapboxgl from 'mapbox-gl';

export const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();

  markers.forEach((marker) => bounds.extend([marker.long, marker.lat]));
  map.fitBounds(bounds, {
    padding: 70,
    duration: 0,
  });

  if (markers.length === 1) {
    map.fitBounds(bounds, {
      zoom: 15,
    });
  }
  // console.log(bounds);
};
