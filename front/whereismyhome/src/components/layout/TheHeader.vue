<template>
  <v-app-bar app color="white" flat class="py-2">
    <v-container class="py-0 fill-height">
      <router-link :to="{ name: 'main' }" class="mr-16 text-h6">
        <v-icon>mdi-home-city-outline</v-icon> 하늘땅 별땅
      </router-link>
      <router-link :to="{ name: 'deal' }" class="mr-16 text-h6">
        지도
      </router-link>
      <router-link :to="{ name: 'board' }" class="mr-16 text-h6 text-black">
        커뮤니티
      </router-link>

      <v-spacer></v-spacer>

      <div>
        <router-link
          :to="{ name: 'signin' }"
          class="text-h6"
          v-if="!this.user()"
        >
          로그인 | 회원가입
        </router-link>
        <button class="text-h6" @click="logout()" v-if="this.user()">
          로그아웃
        </button>
      </div>
    </v-container>
  </v-app-bar>
</template>

<script>
import { mapState, mapMutations } from "vuex";

export default {
  name: "TheHeader",
  data: () => ({
    links: ["지도", "커뮤니티"],
    ...mapState("userStore", ["user"]),
  }),
  methods: {
    ...mapMutations("userStore", { setUser: "SET_USER" }),
    logout() {
      this.setUser(null);
      this.$router.push({ name: "main" });
    },
  },
};
</script>

<style scoped>
button {
  color: blue;
}
</style>
