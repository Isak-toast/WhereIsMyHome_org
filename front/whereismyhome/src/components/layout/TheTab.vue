<template>
  <v-tabs fixed-tabs background-color="indigo" dark class="mb-5" height="75">
    <v-tab>
      <router-link :to="{ name: 'board' }" class="mr-16 text-h6 white--text">
        자유 게시판
      </router-link>
    </v-tab>
    <v-tab>
      <router-link :to="{ name: 'notice' }" class="mr-16 text-h6 white--text">
        공지사항
      </router-link>
    </v-tab>
  </v-tabs>
</template>

<script>
export default {};
</script>

<style></style>
