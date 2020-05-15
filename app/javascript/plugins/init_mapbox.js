import mapboxgl from 'mapbox-gl';


const fitMapToMarkers = (map, markers) => {
  if (markers) {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  };
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });
    console.log(map)
    const markers = JSON.parse(mapElement.dataset.markers);
    if (markers) {
      markers.forEach((marker) => {
        const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
        const element = document.createElement('div');
          element.className = 'marker';
          element.style.backgroundImage = `url('${marker.image_url}')`;
          element.style.backgroundSize = 'contain';


        new mapboxgl.Marker(element)
          .setLngLat([ marker.lng, marker.lat ])
          .setPopup(popup)
          .addTo(map);
      });
      fitMapToMarkers(map, markers)
      map.on('load', function () {
        map.resize();
      });
    }
    fitMapToMarkers(map)
    map.on('load', function () {
      map.resize();
    });
  }
};



export { initMapbox, fitMapToMarkers };


