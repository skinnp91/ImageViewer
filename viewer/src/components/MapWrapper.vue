<template>
  <div class="map-flex-item">
    <div class="map-flex-title">
      <h2>{{ $props.title }}</h2>
    </div>
    <div class="map-flex-container">
      <component :is="$props.mapType" :mapId="$props.mapId" />
    </div>
  </div>
</template>

<script>
import components from './maps';

export default {
  name: 'MapWrapper',
  props: {
    title: {
      type: String,
      required: true,
    },
    mapType: {
      type: String,
      required: true,
      validator(value) {
        // The value must match one of these strings
        return Object.keys(components).indexOf(value) !== -1;
      },
    },
    mapId: {
      type: String,
      required: true,
    },
  },
  components,
};
</script>

<style scoped>
.map-flex-item {
  display: flex;
  flex-direction: column;
  width: 45%;
  min-width: 600px;
  height: 600px;
}

.map-flex-title {
  flex-shrink: 0;
  flex-grow: 0;
}
.map-flex-container {
  flex-grow: 1;
  align-content: stretch;
}
</style>
