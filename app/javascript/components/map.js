import mapboxgl from 'mapbox-gl'
// import 'mapbox-gl/dist/mapbox-gl.css';

mapboxgl.accessToken = 'pk.eyJ1IjoiYXltZXJpYzIzIiwiYSI6ImNrcnlvcmZvMTBreHUydm1yc2w4ZGN4MnQifQ.nWPJUbTLTBJwO7Y6TchQnw';
  const map = new mapboxgl.Map({
    container: 'map', // container ID
    style: 'mapbox://styles/mapbox/streets-v11', // style URL
    center: [0.7737501347029947, 44.55994903365295], // starting position [lng, lat]
    zoom: 16, // starting zoom
  });

export { map }
