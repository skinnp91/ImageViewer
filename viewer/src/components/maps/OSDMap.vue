<template>
  <div :id="$props.mapId" class="map">
  </div>
</template>

<script>
/** OpenSeadragon Libraries */
import OpenSeadragon from 'openseadragon';
import paper from 'paper';

/** Test data */
import moon from '@/../data/images/moon.jpg';
// import regions from '@/../data/json/regions.json';
import points from '@/../data/json/points.json';

const OSDoptions = {
  showNavigationControl: false,
};

export default {
  name: 'OSDMap',
  props: {
    mapId: {
      type: String,
      required: true,
    },
  },
  mounted() {
    this.initMap();
    this.initLayers();
    // this.addData();
  },
  data() {
    return {
      map: null,
      imageLayer: null,
      jsonLayer: null,
      features: [],
    };
  },
  methods: {
    initMap() {
      this.map = OpenSeadragon({
        id: this.$props.mapId,
        ...OSDoptions,
      });
    },
    initLayers() {
      this.map.addSimpleImage({ url: moon });
      // this.jsonLayer = this.map.paperjsOverlay();
      window.onresize = () => {
        this.jsonLayer.resize();
        this.jsonLayer.resizecanvas();
      };
    },
    addData() {
      const pointRadius = 100;
      points.features.forEach((feature) => {
        this.features.push(new paper.Path.Circle(
          new paper.Point(
            feature.geometry.coordinates[1], feature.geometry.coordinates[0],
          ),
          pointRadius,
        ));
      });
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
