<template>
  <v-main>
    <the-carousel />
    <the-recommend />
    <the-guide />
  </v-main>
</template>

<script>
import TheCarousel from "@/components/layout/TheCarousels.vue";
import TheGuide from "@/components/layout/TheGuide.vue";
import TheRecommend from "@/components/layout/TheRecommend.vue";

export default {
  name: "AppMain",
  components: {
    TheCarousel,
    TheGuide,
    TheRecommend,
  },
};
</script>

<style></style>
