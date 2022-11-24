<template>
  <b-container>
    <div class="navbar">
      <b-navbar type="dark" variant="faded" class="m-3" sticky>
        <!-- navbar brand start -->
        <b-navbar-brand>
          <router-link :to="{ name: 'main' }">
            <b-icon icon="house-door-fill" /> 하늘땅 별땅
          </router-link>
        </b-navbar-brand>
        <!-- navbar brand end -->

        <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

        <!-- nav-collapse start -->
        <b-collapse id="nav-collapse" is-nav>
          <!-- navbar-nav start -->
          <b-navbar-nav>
            <!-- nav-item start -->
            <b-nav-item class="mx-3">
              <router-link :to="{ name: 'deal' }">
                <b-icon icon="building" /> 아파트
              </router-link>
            </b-nav-item>

            <b-nav-item class="mx-3">
              <router-link :to="{ name: 'notice' }">
                <b-icon icon="bell" /> 공지사항
              </router-link>
            </b-nav-item>

            <b-nav-item class="mx-3">
              <router-link :to="{ name: 'board' }">
                <b-icon icon="people" /> 자유게시판
              </router-link>
            </b-nav-item>

            <b-nav-item class="mx-3">
              <router-link :to="{ name: 'interest' }">
                <b-icon icon="newspaper" /> 부동산 뉴스
              </router-link>
            </b-nav-item>
            <!-- nav-item end -->
          </b-navbar-nav>
          <!-- navbar-nav end -->

          <!-- Right aligned nav items -->
          <!-- login state start -->
          <b-navbar-nav class="ml-auto" v-if="getLoginUser">
            <b-nav-item-dropdown right>
              <template #button-content>
                <b-icon icon="person-circle" variant="secondary"></b-icon>
              </template>

              <b-dropdown-item>
                <router-link :to="{ name: 'join' }">
                  <b-icon icon="check-circle"></b-icon> 마이페이지
                </router-link>
              </b-dropdown-item>

              <b-dropdown-item>
                <router-link :to="{ name: 'logout' }">
                  <b-icon icon="key"></b-icon> 로그아웃
                </router-link>
              </b-dropdown-item>
            </b-nav-item-dropdown>
          </b-navbar-nav>
          <!-- login state end -->

          <!-- not login state start -->
          <b-navbar-nav class="ml-auto" v-else>
            <b-nav-item-dropdown right>
              <template #button-content>
                <b-icon icon="person-circle" variant="secondary"></b-icon>
              </template>

              <b-dropdown-item>
                <router-link :to="{ name: 'signup' }">
                  <b-icon icon="check-circle" /> 회원가입
                </router-link>
              </b-dropdown-item>

              <b-dropdown-item>
                <router-link :to="{ name: 'login' }">
                  <b-icon icon="key" /> 로그인
                </router-link>
              </b-dropdown-item>
            </b-nav-item-dropdown>
          </b-navbar-nav>
          <!-- not login state end -->
        </b-collapse>
        <!-- nav-collapse end -->
      </b-navbar>
    </div>
  </b-container>
</template>

<script>
export default {
  name: "TheHeader",
  data() {
    return {
      loginUser: null,
    };
  },
  methods: {
    logout() {
      this.$store.commit("LOGOUT");
    },
  },
  computed: {
    getLoginUser: function () {
      console.log(this.loginUser);
      return this.$store.getters.getLoginUser;
    },
  },
};
</script>

<style scoped>
.link {
  text-decoration: none;
}
a {
  color: black;
}
.navbar {
  min-width: 900px;
}
</style>
