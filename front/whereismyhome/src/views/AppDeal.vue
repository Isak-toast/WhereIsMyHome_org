<template>
  <div class="deal-container">
    <deal-search-bar></deal-search-bar>
    <deal-map></deal-map>
  </div>
</template>

<script>
import DealSearchBar from "@/components/deal/DealSearchBar.vue";
import DealMap from "@/components/deal/DealMap.vue";

export default {
  name: "AppDeal",
  components: {
    DealSearchBar,
    DealMap,
  },
};
</script>

<style scoped>
.deal-container {
  position: fixed;
  display: flex;
  top: 64px;
  width: 100%;
  height: 100vh;
  margin: 0;
  overflow-y: hidden;
  z-index: 999;
}
</style>

