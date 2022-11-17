<template>
  <b-container class="bv-example-row mt-3">
    <b-row>
      <b-col>
        <b-alert variant="secondary" show><h3>로그인</h3></b-alert>
      </b-col>
    </b-row>
    <b-row>
      <b-col></b-col>
      <b-col cols="8">
        <b-card class="text-center mt-3" style="max-width: 40rem" align="left">
          <b-form class="text-left">
            <b-alert show variant="danger" v-if="isLoginError">아이디 또는 비밀번호를 확인하세요.</b-alert>
            <b-form-group label="아이디:" label-for="userid">
              <b-form-input
                type="email"
                id="userid"
                v-model="email"
                required
                placeholder="아이디 입력...."
                @keyup.enter="confirm"
              ></b-form-input>
            </b-form-group>
            <b-form-group label="비밀번호:" label-for="userpwd">
              <b-form-input
                type="password"
                id="userpwd"
                v-model="password"
                required
                placeholder="비밀번호 입력...."
                @keyup.enter="confirm"
              ></b-form-input>
            </b-form-group>
            <b-button type="button" variant="primary" class="m-1" @click="login">로그인</b-button>
            <b-button type="button" variant="success" class="m-1" @click="movePage">회원가입</b-button>
          </b-form>
        </b-card>
      </b-col>
      <b-col></b-col>
    </b-row>
  </b-container>
</template>

<script>

export default {
  name: "UserLogin",
  data() {
    return {
      isLoginError: false,
      email: null,
      password: null,
    };
  },
  methods: {
    async login() {
      let user = {};
      user.email = this.email;
      user.password = this.password;
      // console.dir(this) // Vue
      await this.$store.dispatch("setLoginUser", user);
      let loginUser = await this.$store.getters.getLoginUser;
      console.log(loginUser);
      if (loginUser) {
        this.$router.push("/");
      } 
    },
    movePage() {
      this.$router.push({ name: "join" });
    },
  },
};
</script>

<style>

</style>

<!-- <template>
  <div class="container">
    <h2>로그인</h2>
    <fieldset class="text-center">
      <label for="id">아이디</label>
      <input type="text" id="id" v-model="id" class="view" /><br />
      <label for="password">비밀번호</label>
      <input
        type="password"
        id="password"
        v-model="password"
        class="view"
      /><br />
      <button class="btn" @click="login">로그인</button>
    </fieldset>
  </div>
</template>
<script>
export default {
  name: "LoginForm",
  data() {
    return {
      id: "",
      password: "",
    };
  },
  methods: {
    login() {
      let user = {
        id: this.id,
        password: this.password,
      };

      this.$store.________("setLoginUser", user);
    },
  },
};
</script>
<style></style> -->

  