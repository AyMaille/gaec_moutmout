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
        field_id: 104,
        long: point[0],
        lat: point[1]
      })
    })
  })
});



const mapContainer = document.getElementById('map');
let fieldPoints = JSON.parse(mapContainer.dataset.fields);
console.log(fieldPoints)
let points = []
let i = 5
fieldPoints.forEach((field) => {
  i+=1
  field.forEach((pointObj) => {
    let point = turf.point([pointObj.long, pointObj.lat]);
    points.push(point)
    // console.log(point)
  });

  let pointsCollection = turf.featureCollection(points);
  let polygonOnMap = turf.convex(pointsCollection)

  map.on('load', () => {
    console.log(typeof map.getSource('fieldSource'))
    if (typeof map.getSource('fieldSource') == undefined) {
      map.addSource('fieldSource',{
        type: 'geojson',
        data: polygonOnMap
      })
    } else {
      console.log(typeof map.getSource('fieldSource'))
      map.getSource('fieldSource').setData(polygonOnMap)
    };

    map.addLayer({
      "id": 'fieldSource',
      "source": 'fieldSource',
      "type": "fill",
      "paint": {
        "fill-color": "#35B912"
      }
    });
  });
});

export { map, draw }
