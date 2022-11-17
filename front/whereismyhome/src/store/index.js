import Vue from "vue";
import Vuex from "vuex";
import router from "@/router";
// import axios from "axios";
import http from "@/api/http"
Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    users: [],
    searchUsers: [],
    user: null,
    loginUser: null,
  },
  getters: {
    userCnt: function (state) {
      return state.users.length;
    },
    searchUserCnt: function (state) {
      return state.searchUsers.length > 0 ? state.searchUsers.length : null;
    },
    getLoginUser: function (state) {
      return state.loginUser;
    }
  },
  mutations: {
    CREATE_USER: function (state, user) {
      state.users.push(user);
    },
    SET_USERS: function (state, users) {
      state.users = users;
    },
    SET_USER: function (state, user) {
      state.user = user;
    },
    SEARCH_NAME: function (state, users) {
      state.searchUsers = users;
    },
    SET_LOGIN_USER: function (state, user) {
      state.loginUser = user;
    },
    LOGOUT: function (state) {
      state.loginUser = null;
    },
  },
  actions: {
    createUser: function ({ commit }, user) {
      // 사용자 정보 생성 mutation
      commit("CREATE_USER", user);
      router.push("/user");
    },
    setUsers: function () {},
    updateUser: function ({ state }, user) {
      for (let i = 0; i < state.users.length; i++) {
        if (state.users[i].id === user.id) {
          Vue.set(state.users, i, user);
          alert("수정 완료");
          break;
        }
      }

      router.push("/user");
    },
    deleteUser: function ({ state }, id) {
      for (let i = 0; i < state.users.length; i++) {
        if (state.users[i].id === id) {
          state.users.splice(i, 1);
          alert("삭제 완료");
          break;
        }
      }

      router.push("/user");
    },
    setUser: function ({ commit, state }, id) {
      for (let i = 0; i < state.users.length; i++) {
        if (state.users[i].id === id) {
          // 상세보기할 사용자 정보 정하는 mutation
          commit("SET_USER", state.users[i]);
          break;
        }
      }
    },
    searchName: function ({ commit, state }, name) {
      let newUserList = [];

      for (let i = 0; i < state.users.length; i++) {
        if (state.users[i].name.indexOf(name) >= 0) {
          newUserList.push(state.users[i]);
        }
      }

      // 사용자 이름 검색 결과 mutation
      commit("SEARCH_NAME", newUserList);
    },
    setLoginUser: function ({ commit }, user) {
      http.post('/user/signin', JSON.stringify(user))
        .then((response) => {
          // console.log(response);
          //console.log(response.data);
          commit("SET_LOGIN_USER", response.data); // store.state로 저장
          alert("로그인 성공");
        })
        .catch((err) => {
          alert(err.response.data.message);
        });
    },
  },
  modules: {},
});
