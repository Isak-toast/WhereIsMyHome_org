<template>
  <v-main>
    <div class="content">
      <v-card class="pa-8">
        <v-card-title class="justify-center text-h4 mb-4">로그인</v-card-title>
        <form @submit.prevent="signin">
          <label>이메일</label>
          <v-text-field class="mb-5" v-model="email" placeholder="ssafy@ssafy.com" outlined hide-details></v-text-field>

          <label>비밀번호</label>
          <v-text-field class="mb-5" v-model="password" type="password" outlined hide-details></v-text-field>
          <v-checkbox label="로그인 상태 저장" />
          <v-btn class="mb-5" large width="100%" height="60" dark color="indigo" elevation="2" @click="signin"
            >로그인</v-btn
          >
        </form>
        <v-row class="pa-5" align="center" justify="space-around">
          <v-col align="center">
            <router-link :to="{ name: 'signup' }" class="black--text">회원가입</router-link>
          </v-col>
          |
          <v-col align="center">
            <router-link :to="{ name: 'signin' }" class="black--text">비밀번호찾기</router-link></v-col
          >
        </v-row>
      </v-card>
    </div>
    <!-- <button @click="showUser()">로그인 정보</button> -->
  </v-main>
</template>

<script>
import http from "@/api/lib/http";
import { mapState, mapMutations } from "vuex";

export default {
  name: "UserSignin",
  data() {
    return {
      email: "",
      password: "",
      ...mapState("userStore", ["user"]),
    };
  },
  methods: {
    signin() {
      if (!this.check()) {
        this.$router.push("/user/signin");
      } else {
        http
          .post("/user/signin", {
            email: this.email,
            password: this.password,
          })
          .then((response) => {
            if(response.status === 200){
              alert("로그인에 성공하였습니다.");
            this.setUser(response.data);
            this.$router.push({name:"main"});
            }else{
              alert("이메일 또는 비밀번호가 일치하지 않습니다.");
              this.$router.push("/user/signin");
            }
          })
          .catch((err) => {
console.log(err);                
          });
      }
    },
    // showUser() {
    //   console.log(this.user().name);
    // },
    check() {
      var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
      if (this.email == "") {
        alert("이메일을 입력하세요.");
        return false;
      }

      if (this.email.match(regExp) == null) {
        alert("이메일 형식으로 입력하세요.");
        return false;
      }

      if (this.password == "") {
        alert("비밀번호를 입력하세요.");
        return false;
      }

      return true;
    },
    
    ...mapMutations("userStore", {
      setUser: "SET_USER",
      
    }),
  },
};
</script>

<style>
.content {
  width: 600px;
  height: 500px;
  position: absolute;
  top: 50%;
  left: 50%;
  margin-left: -300px;
  margin-top: -250px;
}
</style>
