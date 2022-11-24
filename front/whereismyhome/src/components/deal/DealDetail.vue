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
        <div class="table_view mt15" style="padding-bottom: 25px">
          <div id="tableDiv" class="tbl_st1 mt10">
            <table id="tableList">
              <colgroup>
                <col width="13%" />
                <col width="8%" />
                <col width="35%" />
                <col width="8%" />
                <col width="14%" />
              </colgroup>
              <thead>
                <tr>
                  <th scope="col">계약</th>
                  <th scope="col">일</th>
                  <th scope="col">체결가격(만원)</th>
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
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState, mapMutations } from "vuex";

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
  // components: {
  //   DealChart,
  // },
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
  thead tr th {
    color: #fff;
    font-size: 10px;
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

