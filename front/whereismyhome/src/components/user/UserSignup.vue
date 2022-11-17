<template>
    <b-container class="bv-example-row mt-3">
      <b-row>
        <b-col>
          <b-alert variant="secondary" show><h3>회원가입</h3></b-alert>
        </b-col>
      </b-row>
      <user-signup-item/>
    </b-container>
  </template>
  
  <script>
import UserSignupItem from './item/UserSignupItem.vue';
  export default {
  components: { UserSignupItem },
    name: "UserRegister",
  };
  </script>
  
  <style></style>
  
