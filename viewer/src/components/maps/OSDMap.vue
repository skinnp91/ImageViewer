<template>
  <div :id="$props.mapId" class="map">
  </div>
</template>

<script>
/** Leaflet Library */
import 'leaflet/dist/leaflet.css';
import * as L from 'leaflet';

/** Test data */
import moon from '@/../data/images/moon.jpg';
import regions from '@/../data/json/regions.json';
import points from '@/../data/json/points.json';

const geojsonMarkerOptions = {
  radius: 8,
  fillColor: '#ff7800',
  color: '#000',
  weight: 1,
  opacity: 1,
  fillOpacity: 0.8,
};

const jsonOptions = {
  pointToLayer(feature, latlng) {
    return L.circleMarker(latlng, geojsonMarkerOptions);
  },
  onEachFeature(feature, layer) {
    // does this feature have a property named popupContent?
    if (feature.properties && feature.properties.description) {
      layer.bindPopup(feature.properties.description);
    }
  },
};

export default {
  name: 'LeafletMap',
  props: {
    mapId: {
      type: String,
      required: true,
    },
  },
  mounted() {
    this.initMap(this.$props.mapId);
    this.initLayers();
    this.addData();
  },
  data() {
    return {
      map: null,
      imageLayer: null,
      jsonLayer: null,
    };
  },
  methods: {
    initMap(elID) {
      this.map = L.map(elID, {
        crs: L.CRS.Simple,
        minZoom: -1,
        zoomSnap: 0.01,
        zoomDelta: 1,
      });
    },
    initLayers() {
      const bounds = [[0, 0], [1000, 1000]];
      this.imageLayer = L.imageOverlay(moon, bounds).addTo(this.map);
      this.jsonLayer = L.geoJSON(null, jsonOptions).addTo(this.map);
      this.map.fitBounds(bounds);
    },
    addData() {
      this.jsonLayer.addData(regions);
      this.jsonLayer.addData(points);
    },
  },
};
</script>

<style scoped>
.map {
  width: 100%;
  height: 100%;
}
</style>
