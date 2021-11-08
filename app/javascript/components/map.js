import mapboxgl from 'mapbox-gl'
import MapboxDraw from "@mapbox/mapbox-gl-draw";
// import 'mapbox-gl/dist/mapbox-gl.css';

mapboxgl.accessToken = 'pk.eyJ1IjoiYXltZXJpYzIzIiwiYSI6ImNrcnlvcmZvMTBreHUydm1yc2w4ZGN4MnQifQ.nWPJUbTLTBJwO7Y6TchQnw';
const map = new mapboxgl.Map({
  container: 'map', // container ID
  style: 'mapbox://styles/mapbox/satellite-v9', // style URL
  center: [0.7737501347029947, 44.55994903365295], // starting position [lng, lat]
  zoom: 15, // starting zoom
});

const draw = new MapboxDraw({
  displayControlsDefault: false,
  // Select which mapbox-gl-draw control buttons to add to the map.
  controls: {
    polygon: true,
    trash: true
  },
  // Set mapbox-gl-draw to draw by default.
  // The user does not have to click the polygon control button first.
  // defaultMode: 'draw_polygon',
});

map.addControl(draw);

// map.on('draw.create', updateArea);
// map.on('draw.delete', updateArea);
// map.on('draw.update', updateArea);
// map.on('touchend', updateArea);

// function updateArea(e) {
//   const data = draw.getAll();
//   const answer = document.getElementById('calculated-area');
//   if (data.features.length > 0) {
//     const area = turf.area(data);
//     // Restrict the area to 2 decimal points.
//     const rounded_area = Math.round(area * 100) / 100;
//     answer.innerHTML = `<p><strong>${rounded_area}</strong></p><p>square meters</p>`;
//   } else {
//     answer.innerHTML = '';
//     if (e.type !== 'draw.delete')
//       alert('Click the map to draw a polygon.');
//   }
// }

const element = document.querySelector("#new-field-draw");
element.addEventListener("click", (event) => {
  event.preventDefault();
  const drawData = draw.getAll();
  const drawPoints = drawData.features[0].geometry.coordinates[0];
  drawPoints.forEach((point) => {
    fetch("http://localhost:3000/corner_positions", {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        field_id: 105,
        long: point[0],
        lat: point[1]
      })
    })
  })
});

const mapContainer = document.getElementById('map');
let cornerPoints = JSON.parse(mapContainer.dataset.fields);
let points = []
cornerPoints[0].forEach((pointObj) => {
  let point = turf.point([pointObj.long, pointObj.lat]);
  points.push(point)
  console.log(point)
  // console.log(pointObj.long)
  // console.log(pointObj.lat)
});
let pointsCollection = turf.featureCollection(points);
let polygonOnMap = turf.convex(pointsCollection)

map.on('load', () => {
  map.addSource('field', {
    "type": "geojson",
    "data": polygonOnMap
  });
  map.addLayer({
    "id": "field",
    "source": "field",
    "type": "fill",
    "paint": {
      "fill-color": "#35B912"
    }
  });
});

export { map, draw }
