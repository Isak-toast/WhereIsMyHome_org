<template>
  <v-main>
    <div class="content">
      <v-card class="pa-8">
        <v-card-title class="justify-center text-h4 mb-4">회원가입</v-card-title>
        <form @submit.prevent="signup">
          <label>이메일</label>
          <v-text-field class="mb-5" v-model="email" placeholder="ssafy@ssafy.com" outlined hide-details></v-text-field>

          <label>비밀번호</label>
          <v-text-field
            class="mb-5"
            v-model="password"
            type="password"
            outlined
            hide-details
          ></v-text-field>

          <label>비밀번호 확인</label>
          <v-text-field
            class="mb-5"
            v-model="password2"
            type="password"
            outlined
            hide-details
          ></v-text-field>

          <label>이름</label>
          <v-text-field class="mb-5" v-model="name" outlined hide-details></v-text-field>

          <label>닉네임</label>
          <v-text-field class="mb-5" v-model="nickname" outlined hide-details></v-text-field>

          <label>전화번호</label>
          <v-text-field class="mb-5" v-model="tel" outlined hide-details></v-text-field>

          <v-btn large width="100%" height="60" dark color="indigo" elevation="2" @click="signup">회원가입</v-btn>
        </form>
      </v-card>
    </div>
  </v-main>
</template>

<script>
import http from "@/api/lib/http";

export default {
  name: "UserSignup",
  data: () => ({
    email: "",
    password: "",
    password2: "",
    name: "",
    nickname: "",
    tel: "",
  }),
  methods: {
    signup() {
      if (!this.check()) {
        this.$router.push("/user/signup");
      } else {
        http
          .post("/user/signup", {
            email: this.email,
            password: this.password,
            name: this.name,
            nickname: this.nickname,
            tel: this.tel,
          })
          .then(()=>{
            alert("회원가입에 성공하였습니다.");
            this.$router.push("/user/signin")
          })
          .catch((err) => {
            if(err.response.status == 400){
              alert("이미 가입된 이메일입니다.")
            }
            this.$router.push("/user/signup");
          });
      }
    },
    check() {
      var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

      if (this.email == "") {
        alert("이메일 주소를 입력하세요.");
        return false;
      }

      if (this.email.match(regExp) == null) {
        alert("이메일 형식으로 입력하세요.");
        return false;
      }

      if (this.password == "" || this.password2 == "") {
        alert("비밀번호를 입력하세요.");
        return false;
      }

      if (this.password !== this.password2) {
        alert("비밀번호가 일치하지 않습니다.");
        return false;
      }

      if (this.name == "") {
        alert("이름을 입력하세요.");
        return false;
      }

      if (this.nickname == "") {
        alert("별명을 입력하세요.");
        return false;
      }

      if (this.tel == "") {
        alert("전화번호를 입력하세요.");
        return false;
      }

      return true;
    },
  },
};
</script>

<style scoped>
.content {
  width: 600px;
  height: 840px;
  position: absolute;
  left: 50%;
  top: 50%;
  margin-left: -300px;
  margin-top: -420px;
}
</style>
