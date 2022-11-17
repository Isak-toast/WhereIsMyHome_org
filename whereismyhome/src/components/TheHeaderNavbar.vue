<template>
  <div>
    <b-navbar toggleable="lg" type="dark" variant="faded">
      <b-navbar-brand href="#">
        <router-link :to="{ name: 'main' }">
          <b-img
            :src="require('@/assets/ssafy_logo.png')"
            id="logo"
            class="d-inline-block align-top"
            alt="logo"
          ></b-img>
        </router-link>
      </b-navbar-brand>

      <b-navbar-toggle target="nav-collapse">
        <template #default="{ expanded }">
        <b-icon v-if="expanded" icon="chevron-bar-up"  variant="secondary"></b-icon>
        <b-icon v-else icon="chevron-bar-down"  variant="secondary"></b-icon>
      </template>
      </b-navbar-toggle>

      <b-collapse id="nav-collapse" is-nav >
        <b-navbar-nav >
          <b-nav-item href="#">
            <router-link :to="{ name: 'main' }" class="m-2 link">
              <b-icon icon="house-door" font-scale="1"></b-icon>
              홈
            </router-link>
            <router-link :to="{ name: 'deal' }" class="m-2 link">
              <b-icon icon="building" font-scale="1"></b-icon>
              아파트
            </router-link>
            <router-link :to="{ name: 'notice' }" class="m-2 link">
              <b-icon icon="bell" font-scale="1"></b-icon>
              공지사항
            </router-link>
            <router-link :to="{ name: 'board' }" class="m-2 link">
              <b-icon icon="people" font-scale="1"></b-icon>
              자유게시판
            </router-link>
            <router-link :to="{ name: 'interest' }" class="m-2 link">
              <b-icon icon="bookmark-heart" font-scale="1"></b-icon>
              관심사항
            </router-link>
          </b-nav-item>
        </b-navbar-nav>

        <!-- Right aligned nav items -->
        <b-navbar-nav class="ml-auto" v-if="getLoginUser">
          <b-nav-item-dropdown right>
            <template #button-content>
              <b-icon icon="person-circle" variant="secondary" font-scale="2"></b-icon>
            </template>
            <b-dropdown-item href="#">
              <router-link :to="{ name: 'join' }" class="link">
                <b-icon icon="check-circle" ></b-icon> 마이페이지
              </router-link>
            </b-dropdown-item>
            <b-dropdown-item href="#">
              <router-link :to="{ name: 'logout' }" class="link"> <b-icon icon="key"></b-icon> 로그아웃 </router-link>
            </b-dropdown-item>
          </b-nav-item-dropdown>
        </b-navbar-nav>
        <b-navbar-nav class="ml-auto" v-else>
          <b-nav-item-dropdown right>
            <template #button-content>
              <b-icon icon="person-circle" variant="secondary" font-scale="2"></b-icon>
            </template>
            <b-dropdown-item href="#">
              <router-link :to="{ name: 'join' }" class="link">
                <b-icon icon="check-circle" ></b-icon> 회원가입
              </router-link>
            </b-dropdown-item>
            <b-dropdown-item href="#">
              <router-link :to="{ name: 'login' }" class="link"> <b-icon icon="key"></b-icon> 로그인 </router-link>
            </b-dropdown-item>
          </b-nav-item-dropdown>
        </b-navbar-nav>
      </b-collapse>
    </b-navbar>
    <hr/>
  </div>
</template>

<script>
export default {
  name: "TheHeaderNavbar",
  data() {
    return {
      loginUser: null
    };
  },
  methods: {
    logout() {
      this.$store.commit("LOGOUT")
    },  
  },
  computed: {
    getLoginUser: function () {
      console.log(this.loginUser);
      return this.$store.getters.getLoginUser;
    }
  }
};
</script>

<style scoped>
#logo {
  width: 120px;
}

.link {
  text-decoration: none;
}
</style>
