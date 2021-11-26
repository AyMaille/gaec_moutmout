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

  // that block allow points drawing and saving with "lier les coordonnées" btn
const element = document.querySelector("#new-field-draw");
element.addEventListener("click", (event) => {
  event.preventDefault();
  event.addEventListener('beforeinput', selectField());

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

  // function to call fields json package and return a flash form to select one of them
function selectField() {
    document.getElementById("popupForm").style.display = "block";

  // function closeForm() {
  //   document.getElementById("popupForm").style.display = "none";
  // }
}

  // block displays exsting polygons using all corner_positions objects
const mapContainer = document.getElementById('map');
let fieldPoints = JSON.parse(mapContainer.dataset.fieldCorners);
let fieldIdArray = []
fieldPoints.forEach((field) => {
  let fieldId = field[0].field_id
  fieldIdArray.push(fieldId)
  fieldPoints = []
  field.forEach( pointObj => {
    let point = turf.point([pointObj.long, pointObj.lat]);
    fieldPoints.push(point)
  });
  let pointsCollection = turf.featureCollection(fieldPoints)
  let feature = turf.convex(pointsCollection)
  // console.log(feature)
  map.on('load', () => {
    map.addSource(fieldId.toString(), {
      type: 'geojson',
      data: {
        "type": "FeatureCollection",
        "features": [{
          "type": "Feature",
          "properties": {},
          "geometry": feature.geometry
        }]
      }
    });

    map.addLayer({
      "id": `fields${fieldId.toString()}-layer`,
      'source': fieldId.toString(),
      "type": "fill",
      "paint": {
        "fill-color": "#35B912",
        'fill-opacity': 0.8
      }
    });
  });
});



export { map, draw }
