<template>
  <div class="open-detail">
    <div class="apt-name" style="">
      <h2 class="apt-h2">{{ apartName }}</h2>
      <button @click="close" class="close-detail">X</button>
    </div>
    <div class="apt-detail">
      <div
        class="article apt_info_chart mt0"
        style="margin-top: 0; padding-top: 6px"
      >
        <h2 class="h2"><span id="chart_info_yyyymm">21년 9월</span></h2>
        <a href="" id="dealBtn" class="dealBtn" style="top: 10px">
          <span class="txtDeal" id="txtDeal">매매, 전세, 월세</span>
          <p class="txtArea">
            <span class="txtPy" id="txtPy">25평</span>
            <span class="txtM" id="txtM2">전용 59㎡</span>
          </p>
          <span class="arr"></span>
        </a>
        <p class="chart_info">
          <span id="chart_info_m" class="co1">매매 130,000 / 1건</span>
          <span id="chart_info_j" class="co2">전세 거래내역 없음</span>
        </p>
        <deal-chart :aptDetails="aptDetails"></deal-chart>
        <div class="slider_year_wrap" style="margin-top: 0">
          <p>
            <span id="date_start">06년 1월</span> ~
            <span id="date_end">22년 11월</span>
          </p>
          <a onclick="setSlider3Year();">최근 3년 보기</a>
          <div id="slider_year" class="noUi-target noUi-ltr noUi-horizontal">
            <div class="noUi-base">
              <div class="noUi-origin" style="left: 0%">
                <div
                  class="noUi-handle noUi-handle-lower"
                  data-handle="0"
                  style="z-index: 5"
                ></div>
              </div>
              <div class="noUi-connect" style="left: 0%; right: 0%"></div>
              <div class="noUi-origin" style="left: 100%">
                <div
                  class="noUi-handle noUi-handle-upper"
                  data-handle="1"
                  style="z-index: 4"
                ></div>
              </div>
            </div>
          </div>

          <table class="tbl_graph">
            <tbody>
              <tr>
                <td style="width: 25%"></td>
                <td style="width: 12.5%"></td>
                <td style="width: 25%"></td>
                <td style="width: 25%"></td>
                <td style="width: 12.5%"></td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="table_view mt15" style="padding-bottom: 25px">
          <div
            class="tooltip_history"
            onclick="closeHistoryTooltip()"
            style="display: none"
          >
            <span>거래 히스토리</span>
          </div>

          <div id="tableDiv" class="tbl_st1 mt10">
            <table id="tableList">
              <colgroup>
                <col width="13%" />
                <col width="8%" />
                <col width="8%" />
                <col width="35%" />
                <col width="14%" />
                <col width="22%" />
              </colgroup>
              <thead>
                <tr>
                  <th scope="col">계약</th>
                  <th scope="col">일</th>
                  <th scope="col">체결가격</th>
                  <th scope="col">평수(㎡)</th>
                  <th scope="col">거래 동층</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="(aptInfo, index) in aptDetails" :key="index">
                  <td class="date2">
                    <span class="mm"
                      >{{ aptInfo.dealYear }}.{{ aptInfo.dealMonth }}</span
                    >
                  </td>
                  <td class="">
                    <span class="dd">{{ aptInfo.dealDay }}</span>
                  </td>
                  <td class="price taL crc co3" style="padding-left: 8px">
                    <span class="b">매매</span
                    ><span
                      class="eb"
                      style="padding-left: 8px; font-size: 15px"
                      >{{ aptInfo.dealAmount }}</span
                    >
                  </td>
                  <td>
                    <span class="mm">{{ aptInfo.area }}</span>
                  </td>
                  <td class="aptNum">
                    <span class="aptfloor">{{ aptInfo.floor }}층</span>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>

          <a onclick="viewAll()" class="more">거래현황 더보기</a>

          <a
            style="background: #5d5d5d"
            onclick="setLink('지역별 최근 거래', '/app/price_of_area.jsp?os=pc&amp;user=0&amp;area=11740')"
            class="more"
          >
            강동구 최근 거래</a
          >
          <a
            style="background: #5d5d5d"
            onclick="parent.openPrice('1174010500', '1500060617');"
            class="more"
            >실거래가 표</a
          >
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState, mapMutations } from "vuex";
import DealChart from "@/components/deal/DealChart.vue";

const houseStore = "houseStore";

export default {
  name: "DealDetail",
  props: {
    code: String,
    apartName: String,
  },
  // data() {
  //   return {
  //     aptDetails: null,
  //   };
  // },
  components: {
    DealChart,
  },
  // data() {
  //   return {
  //     code: this.code,
  //     apartName: this.apartName,
  //   };
  // },
  computed: {
    ...mapState(houseStore, ["aptDetails"]),
  },
  // mounted() {
  //   console.log("디테일 선언");
  //   console.log(this.$store);
  //   console.log(this.$store.state.houseStore.aptDetails);
  //   this.aptDetails = this.$store.state.houseStore.aptDetails;
  // },
  methods: {
    ...mapMutations(houseStore, ["CLEAR_APT_DETAIL"]),
    close() {
      // this.$store.state.houseStore.aptDetails = []; // clear_apt_detail
      // console.log(this.$store.state.houseStore.aptDetails);
      this.CLEAR_APT_DETAIL();
      // console.log(this.$store.state.houseStore.aptDetails);
      this.$emit("close");
    },
  },
};
</script>

<style scoped lang="scss">
.open-detail {
  position: absolute;
  margin: 0;
  padding: 0px 0px 0px 16px;
  height: 100%;
  width: 390px;
  left: 0;
  z-index: 1001;
  background: #fff;
  .apt-h2 {
    font-size: 20px;
    font-weight: bold;
  }
  .apt-name {
    padding: 10px 20px 5px 10px;
    border-top: solid 1px skyblue;
    display: flex;
    justify-content: space-between;
    .close-detail {
      border: none;
      background: #fff;
    }
  }
  .apt-detail {
    border-top: solid 1px gray;
    height: 100%;
    overflow-y: scroll;
  }
}

table {
  width: 100%;
  border-collapse: collapse;
  border-spacing: 0;
  tbody {
    width: 100%;
  }
  thead th {
    color: #fff;
    font-size: 20px;
    background: #5d5d5d;
  }

  thead tr th,
  tbody tr td {
    margin: 0;
    padding: 6px;
    border: solid 1px #e5e5e5;
  }
}
</style>

