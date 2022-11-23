<template>
  <div class="open-detail" :class="type">
    <div class="flex justify-end">
      <button @click="close" class="close-detail">X</button>
    </div>
  </div>
</template>

<script>
export default {
  name: "DealDetail",
  methods: {
    close() {
      this.$emit("close");
    },
  },
};
</script>

<style>
</style>