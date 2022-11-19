<template>
    <span
    class="m-0 border p-2"
    @click="selectArea(sido.value)"
    @mouseover="colorChange(true)"
    @mouseout="colorChange(false)"
    :class="{ 'mouse-over-bgcolor': isColor }">
        {{ sido.text }}
    </span>
</template>

<script>
import { mapActions } from "vuex";
export default {
    name: "DealSearchItem",
    data() {
        return {
            isColor: false,
        };
    },
    props: {
        sido: Object,
        gugun: Object,
        dong: Object,
    },
    methods: {
    ...mapActions(["detailSido", "detailGugun", "detailDong"]),
    selectArea(code) {
      console.log("listRow : ", code);
      // this.$store.dispatch("getHouse", this.house);

        this.detailSido(this.area);
        this.detailGugun(this.area);
        this.detailDong(this.area);
    },
    colorChange(flag) {
      this.isColor = flag;
    },
  },
}
</script>

<style scoped>
.mouse-over-bgcolor {
  background-color: skyblue;
}
</style>