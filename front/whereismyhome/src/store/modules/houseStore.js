import * as house from "@/api/house.js";

const houseStore = {
  namespaced: true,
  state: {
    sidos: [{ value: null, text: "시/도" }],
    sido: "시/도",
    guguns: [{ value: null, text: "구/군" }],
    gugun: "구/군",
    dongs: [{ value: null, text: "동/읍" }],
    dong: "동/읍",
    apts: [],
    apt: null,
    aptDetails: [],
    houses: [],
    house: null,

    map: null,
    kakao: null,
    marker: null,
    mapLat: 35.850701,
    mapLng: 128.570667,
  },
  getters: {
    getAptList: function (state) {
      return state.apts;
    },
    getMap: function (state) {
      return state.map;
    },
  },
  mutations: {
    CLEAR_SIDO_LIST(state) {
      state.sidos = [{ value: null, text: "시/도" }];
      // state.sidos = [];
    },
    CLEAR_GUGUN_LIST(state) {
      state.guguns = [{ value: null, text: "구/군" }];
      // state.guguns = [];
    },
    CLEAR_DONG_LIST(state) {
      state.dongs = [{ value: null, text: "동/읍" }];
      // state.dongs = [];
    },
    CLEAR_SIDO(state) {
      state.sido = "시/도";
    },
    CLEAR_GUGUN(state) {
      state.gugun = "구/군";
    },
    CLEAR_DONG(state) {
      state.dong = "동/읍";
    },
    CLEAR_APT_LIST(state) {
      state.apts = [];
    },
    CLEAR_APT_NAME(state) {
      state.apt = null;
    },
    CLEAR_APT_DETAIL(state) {
      state.aptDetails = [];
    },
    CLEAR_HOUSE_LIST(state) {
      state.houses = [];
      state.house = null;
    },
    SET_SIDO_LIST(state, sidos) {
      sidos.forEach((sido) => {
        state.sidos.push({ value: sido.code, text: sido.name });
      });
    },
    SET_GUGUN_LIST(state, guguns) {
      guguns.forEach((gugun) => {
        state.guguns.push({ value: gugun.code, text: gugun.name });
      });
    },
    SET_DONG_LIST(state, dongs) {
      dongs.forEach((dong) => {
        state.dongs.push({ value: dong.code, text: dong.name });
      });
    },
    SET_KAKAO(state, kakao) {
      state.kakao = kakao;
    },
    SET_KAKAO_MAP(state, map) {
      state.map = map;
    },
    SET_KAKAO_MARKER(state, marker) {
      state.marker = marker;
    },
    SET_DETAIL_SIDO(state, sido) {
      state.sido = sido;
    },
    SET_DETAIL_GUGUN(state, gugun) {
      state.gugun = gugun;
    },
    SET_DONG_GUGUN(state, dong) {
      state.dong = dong;
    },
    SET_APT_LIST(state, apts) {
      state.apts = apts;
    },
    SET_APT_DETAIL(state, aptDetails) {
      state.aptDetails = aptDetails;
    },
    SET_APT_NAME(state, apt) {
      state.apt = apt;
    },
    SET_HOUSE_LIST(state, houses) {
      state.houses = houses;
    },
    SET_DETAIL_HOUSE(state, house) {
      state.house = house;
    },
  },
  actions: {
    getSido: ({ commit }, type) => {
      const params = {
        type,
      };
      house.sidoList(
        params,
        ({ data }) => {
          console.log(data);
          commit("SET_SIDO_LIST", data);
        },
        (error) => {
          alert(error);
          console.log(error);
        }
      );
    },
    getGugun: ({ commit }, params) => {
      console.log(params);
      house.gugunList(
        params,
        ({ data }) => {
          commit("SET_GUGUN_LIST", data);
        },
        (error) => {
          alert(error);
          console.log(error);
        }
      );
    },
    getDong: ({ commit }, params) => {
      console.log(params);
      house.dongList(
        params,
        ({ data }) => {
          commit("SET_DONG_LIST", data);
        },
        (error) => {
          alert(error);
          console.log(error);
        }
      );
    },
    getAptList: ({ commit }, params) => {
      house.aptList(
        params,
        ({ data }) => {
          console.log(data);
          commit("SET_APT_LIST", data);
        },
        (error) => {
          console.log(error);
        }
      );
    },
    getAptDetail: ({ commit }, params) => {
      house.aptDetail(
        params,
        ({ data }) => {
          console.log("데이터 변경");
          console.log(data);
          commit("SET_APT_DETAIL", data);
        },
        (error) => {
          console.log(error);
        }
      );
    },
    getHouseList: ({ commit }, gugunCode) => {
      const SERVICE_KEY = process.env.VUE_APP_APT_DEAL_API_KEY;
      const params = {
        LAWD_CD: gugunCode,
        DEAL_YMD: "202207",
        serviceKey: decodeURIComponent(SERVICE_KEY),
      };
      house.houseList(
        params,
        ({ data }) => {
          console.log(data.response.body.items.item);
          commit("SET_HOUSE_LIST", data.response.body.items.item);
        },
        (error) => {
          console.log(error);
        }
      );
    },
    detailSido: ({ commit }, sido) => {
      commit("SET_DETAIL_HOUSE", sido);
    },
    detailGugun: ({ commit }, gugun) => {
      commit("SET_DETAIL_HOUSE", gugun);
    },
    detailDong: ({ commit }, dong) => {
      // 나중에 house.일련번호를 이용하여 API 호출
      commit("SET_DETAIL_HOUSE", dong);
    },
    detailHouse: ({ commit }, house) => {
      // 나중에 house.일련번호를 이용하여 API 호출
      commit("SET_DETAIL_HOUSE", house);
    },
  },
};

export default houseStore;
