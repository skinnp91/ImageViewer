<template>
  <div id="app">
    <div class="map-flex-wrapper">
      <MapWrapper title="Leaflet Map" mapType="LeafletMap" mapId="leaflet-map" />
      <MapWrapper title="OSD Map (Not Yet Implemented)" mapType="OSDMap" mapId="osd-map" />
    </div>
  </div>
</template>

<script>
import MapWrapper from '@/components/MapWrapper.vue';

export default {
  name: 'app',
  components: {
    MapWrapper,
  },
};
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}

.map-flex-wrapper {
  display: flex;
  flex-wrap: wrap;
  flex-direction: row;
  justify-content: center;
  align-content: space-between;
  width: 100%;
}
</style>
