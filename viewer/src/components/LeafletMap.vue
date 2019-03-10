<template>
  <div :id="$options.mapID" :class="$options.mapID">
  </div>
</template>

<script>
import 'leaflet/dist/leaflet.css';
import * as L from 'leaflet';
import moon from '@/../images/moon.jpg';

const mapID = 'map';

export default {
  name: 'LeafletMap',
  mapID,
  mounted() {
    this.initMap(this.$options.mapID);
    this.initLayers();
  },
  data() {
    return {
      map: null,
      tileLayer: null,
      layers: [],
    };
  },
  methods: {
    initMap(elID) {
      this.map = L.map(elID, {
        crs: L.CRS.Simple,
      });
    },
    initLayers() {
      const bounds = [[0, 0], [1000, 1000]];
      this.layers.push(L.imageOverlay(moon, bounds).addTo(this.map));
      // this.tileLayer = L.tileLayer(
      //   'https://cartodb-basemaps-{s}.global.ssl.fastly.net/rastertiles/voyager/{z}/{x}/{y}.png',
      //   {
      //     maxZoom: 18,
      //     attribution: '&copy; 2019',
      //   },
      // );
      // this.tileLayer.addTo(this.map);
    },
  },
};
</script>

<style scoped>
#map {
  width: 800px;
  height: 600px;
}
</style>
