<template>
  <v-footer color="#373737">
    <v-card-text class="white--text pt-0">
      Phasellus feugiat arcu sapien, et iaculis ipsum elementum sit amet. Mauris
      cursus commodo interdum. Praesent ut risus eget metus luctus accumsan id
      ultrices nunc. Sed at orci sed massa consectetur dignissim a sit amet dui.
      Duis commodo vitae velit et faucibus. Morbi vehicula lacinia malesuada.
      Nulla placerat augue vel ipsum ultrices, cursus iaculis dui sollicitudin.
      Vestibulum eu ipsum vel diam elementum tempor vel ut orci. Orci varius
      natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.
    </v-card-text>

    <v-divider></v-divider>

    <v-card-text class="white--text">
      {{ new Date().getFullYear() }} — <strong>김이삭, 이진섭</strong>
    </v-card-text>
  </v-footer>
</template>

<script>
export default {
  name: "TheFooter",
};
</script>

<style></style>
