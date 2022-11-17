<template>
  <b-container class="bv-example-row mt-3 text-center">
    <h3 class="underline-steelblue"><b-icon icon="house"></b-icon> Home Sweet Home</h3>
    <b-row>
      <b-col>
        <main-select></main-select>
      </b-col>
    </b-row>
    <b-row>
      <b-col>
        <main-area></main-area>
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
  import MainSelect from "@/components/main/MainSelect.vue";
  import MainArea from "@/components/main/MainArea.vue";


  export default {
    name: "AppMain",
    props: {
      msg: String,
    },
    components: {
      MainSelect,
      MainArea,
    },
  };
</script>

<style scoped>
  .underline-steelblue {
    display: inline-block;
    background: linear-gradient(180deg, rgba(255, 255, 255, 0) 70%, rgba(72, 190, 233, 0.3) 30%);
  }
</style>
