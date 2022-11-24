<template>
  <v-app>
    <the-header />
    <router-view />
    <the-footer />
  </v-app>
</template>

<script>
import TheHeader from "@/components/layout/TheHeader.vue";
import TheFooter from "@/components/layout/TheFooter.vue";

export default {
  name: "App",
  components: {
    TheHeader,
    TheFooter,
  },
};
</script>

<style>
a {
  text-decoration: none;
}
</style>
