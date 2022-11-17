<template>
    <div>
      <b-img src="https://s.zigbang.com/v1/web/main/hero_img_1920.jpg" fluid alt="Responsive image"></b-img>
  <b-container class="bv-example-row mt-3 text-center">
    <b-row>
      <b-col>
        <main-notice></main-notice>
      </b-col>
    </b-row>
  </b-container>
    </div>
</template>

<script>
  import MainNotice from "@/components/main/MainNotice.vue";

  export default {
    name: "AppMain",
    props: {
      msg: String,
    },
    components: {
      MainNotice,
    },
  };
</script>

<style scoped>
  .underline-steelblue {
    display: inline-block;
    background: linear-gradient(180deg, rgba(255, 255, 255, 0) 70%, rgba(72, 190, 233, 0.3) 30%);
  }
</style>
