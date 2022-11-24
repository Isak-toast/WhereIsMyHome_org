const userStore = {
    namespaced: true,
    state: {
      logined: false,
      user: null,
    },
    getters: {},
    mutations: {
      SET_USER(state, payload) {
        state.user = payload;
      },
      SET_LOGINED(state, payload) {
        state.logined = payload;
      },
    },
    actions: {},
  };

  export default userStore;