<template>
  <div class="apt-list-wrap">
    <deal-detail
      v-if="open"
      :apart-name="clickedAptName"
      :code="clickedAptCode"
      @close="open = false"
    />

    <b-form-input
      class="input-apt"
      v-model="textContent"
      type="text"
      placeholder="원하시는 아파트 이름을 입력하세요."
      @keydown.enter.native="searchApt"
    ></b-form-input>
    <div class="select-group">
      <!-- <a href="#" :value="sido" @click="gugunList">시/도</a> |
      <a href="#" :value="gugun" @click="dongList">구/군</a> |
      <a href="#" :value="dong" @click="searchApt">동/읍</a> -->
      <!-- <span :value="sido" @click="gugunList">시/도</span>
      <span :value="gugun" @click="gugunList"></span>
      <span :value="dong" @click="gugunList"></span> -->
      <b-form-select
        v-model="sidoCode"
        :options="sidos"
        @change="gugunList"
      ></b-form-select>
      <b-form-select
        v-model="gugunCode"
        :options="guguns"
        @change="dongList"
      ></b-form-select>
      <b-form-select
        v-model="dongCode"
        :options="dongs"
        @change="searchApt"
      ></b-form-select>
    </div>
    <div class="list-sorting"></div>
    <div class="apt-list-area">
      <b-container>
        <div class="apt-list" v-show="apts.length != 0">
          <!-- <div class="item type1" onclick="openBuilding('apt',{{ value.code }}, {{ value.apartmentName }},'37.541218711','127.14817456');"> -->
          <div
            class="item type1"
            @click="selectApt(value)"
            v-for="(value, index) in apts"
            :key="index"
          >
            <p class="title">
              {{ value.apartmentName }}
            </p>
            <p class="info">
              <span>건축년도 : {{ value.buildYear }}년</span
              ><span>평형 : {{ value.area }}㎡</span
              ><span>{{ value.floor }}층</span>
            </p>
            <p class="addr">
              {{ value.sidoName }} {{ value.gugunName }} {{ value.name }}
              {{ value.jibun }}
            </p>
          </div>
        </div>
        <div v-show="apts.length == 0" style="text-align: center">
          데이터가 없습니다.
        </div>
      </b-container>

      <!-- <b-container v-if="apts && apts.length != 0" class="bv-example-row mt-3">
        <ul>
          <li v-for="(value, i) in this.$store.state.apts" v-bind:key="value.code">번호 : {{i}}, 지역 : {{value}}</li>
        </ul>
      </b-container> -->
      <!-- <b-container v-if="sidos && sidos.length != 0" class="bv-example-row mt-3">
        <deal-search-item v-for="(sido, index) in sidos" :key="index" :sido="sido" />
      </b-container>
      <b-container v-if="dongs && dongs.length != 0" class="bv-example-row mt-3">
        <deal-search-item v-for="(dong, index) in dongs" :key="index" :dong="dong" />
      </b-container>
      <b-container v-if="guguns && guguns.length != 0" class="bv-example-row mt-3">
        <deal-search-item v-for="(gugun, index) in guguns" :key="index" :gugun="gugun" />
      </b-container> -->
    </div>
    <!-- <b-form-select v-model="selected" :options="options" size="sm"></b-form-select>
    <b-form-select v-model="selected" :options="options" size="sm"></b-form-select>
    <b-form-select v-model="selected" :options="options" size="sm"></b-form-select>
    <div class="mt-3">Selected: <strong>{{ selected }}</strong></div> -->
  </div>
</template>

<script>
import { mapState, mapActions, mapMutations } from "vuex";
import DealDetail from "@/components/deal/DealDetail.vue";

const houseStore = "houseStore";

export default {
  name: "DealSearchBar",
  components: {
    DealDetail,
  },
  data() {
    return {
      sidoCode: null,
      gugunCode: null,
      dongCode: null,
      textContent: null,
      items: [],
      open: false,
      clickedAptName: null,
      clickedAptCode: null,
    };
  },
  computed: {
    ...mapState(houseStore, [
      "sidos",
      "guguns",
      "dongs",
      "sido",
      "gugun",
      "dong",
      "apts",
    ]),

    // sidos() {
    //   return this.$store.state.sidos;
    // },
  },
  created() {
    // this.$store.dispatch("getSido");
    // this.sidoList();
    this.CLEAR_SIDO_LIST();
    this.CLEAR_APT_LIST();
    this.getSido("sido");
  },
  methods: {
    ...mapActions(houseStore, ["getSido", "getGugun", "getDong", "getAptList"]),
    ...mapMutations(houseStore, [
      "CLEAR_SIDO_LIST",
      "CLEAR_GUGUN_LIST",
      "CLEAR_DONG_LIST",
      "CLEAR_APT_LIST",
    ]),
    // sidoList() {
    //   this.getSido();
    // },
    // openBuilding(type, code, atpName, lng, lat){},
    gugunList() {
      const params = {
        type: "gugun",
        code: this.sidoCode,
      };
      this.CLEAR_GUGUN_LIST();
      this.CLEAR_DONG_LIST();
      this.gugunCode = null;
      this.dongCode = null;
      if (this.sidoCode) this.getGugun(params);
    },
    dongList() {
      const params = {
        type: "dong",
        code: this.gugunCode,
      };
      this.CLEAR_DONG_LIST();
      this.dongCode = null;
      if (this.gugunCode) this.getDong(params);
    },

    searchApt() {
      const params = {
        dong: this.dongCode,
        text: this.textContent,
      };
      if (this.dongCode) this.getAptList(params);
    },
    clickApt(aptInfo) {
      console.log(aptInfo);
    },
    selectApt(aptInfo) {
      console.log(aptInfo);
      this.clickedAptName = aptInfo.apartmentName;
      this.clickedAptCode = aptInfo.aptCode;
      this.open = true; // 상세 컴포넌트 열기
    },
  },

  // data() {
  //   return {
  //     selected: null,
  //     options: [
  //       { value: null, text: 'Please select an option' },
  //       { value: 'a', text: 'This is First option' },
  //       { value: 'b', text: 'Selected Option' },
  //       { value: { C: '3PO' }, text: 'This is an option with object value' },
  //       { value: 'd', text: 'This one is disabled', disabled: true }
  //     ]
  //   }
  // }
};
</script>

<style scoped lang="scss">
* {
  margin: 0;
  padding: 0;
}
.apt-list-wrap {
  width: 390px;
  height: 100%;
  position: relative;
  overflow-y: auto;
  overflow-x: hidden;
}
.apt-list-wrap > .input-apt {
  width: 350px;
  margin: auto;
}
.select-group {
  margin: 10px 10px;
  position: absolute;
  z-index: 3;
  display: flex;
  overflow: auto;
  width: 370px;
}
.select-group > select {
  width: 100%;
  text-decoration: none;
  font-size: 16px;
}
.apt-list-area {
  padding-top: 60px;
  word-break: keep-all;
}
.apt-list {
  height: 100%;
  padding-bottom: 88px;
  overflow-y: auto;
  text-align: start;
}
.item:hover {
  background: #c6e8f2;
  .title {
    text-decoration: underline black;
    mix-blend-mode: darken;
  }
}
.apt-list > .item {
  padding: 14px 0 14px 16px;
  border-bottom: 1px solid #e3e3e3;
}
.apt-list > .item > .title {
  font-weight: 700;
  font-size: 15px;
}
.apt-list > .item > .title {
  font-weight: 700;
  font-size: 15px;
}
.apt-list > .item > .info {
  padding-top: 5px;
  white-space: nowrap;
  overflow: hidden;
}
.apt-list > .item > .info > span:first-child {
  padding-left: 0;
}
.apt-list > .item > .info > span {
  display: inline;
  position: relative;
  font-size: 13px;
  padding: 0 7px 0 8px;
  color: #333;
  letter-spacing: -0.04em;
}
.apt-list > .item > .addr {
  padding-top: 1px;
  font-size: 12px;
}
</style>