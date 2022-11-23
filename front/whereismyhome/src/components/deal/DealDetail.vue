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
        <div style="width: 300px; height: 300px">
          <!--차트가 그려질 부분-->
          <canvas id="myChart"></canvas>
        </div>
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
                <td style="width: 12.5%">06년</td>
                <td style="width: 25%">10년</td>
                <td style="width: 25%">14년</td>
                <td style="width: 25%">18년</td>
                <td style="width: 12.5%">21년</td>
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
                  <th scope="col">경과</th>
                  <th scope="col">체결가격</th>
                  <th scope="col">타입</th>
                  <th scope="col">거래 동층</th>
                </tr>
              </thead>
              <tbody>
                <tr
                  style=""
                  onclick="clickPrice(this,20402255,1777,1200399,1209412,'4억 5,000','/30','104동','21층','22.1010')"
                >
                  <td class="date2"><span class="mm">22.10</span></td>
                  <td class=""><span class="dd">10</span></td>
                  <td class="days">
                    <img
                      src="/app/images/date_0.png"
                      style="width: 20px; height: 20px"
                    />
                  </td>
                  <td class="price taL crc co3" style="padding-left: 8px">
                    <span class="b">월세</span
                    ><span class="eb" style="padding-left: 8px; font-size: 15px"
                      >4억 5,000/30</span
                    >
                  </td>
                  <td><span class="mm">59A</span></td>
                  <td class="aptNum">
                    <span class="aptdong">104동</span
                    ><span class="aptfloor">21층</span>
                  </td>
                </tr>
                <tr
                  style=""
                  onclick="clickPrice(this,20402255,1767,1500028,1509031,'6억 2,000','','105동','2층','22.1003')"
                >
                  <td class=""><span class="mm"></span></td>
                  <td class=""><span class="dd">03</span></td>
                  <td class="days">
                    <img
                      src="/app/images/date_14.png"
                      style="width: 20px; height: 20px"
                    />
                  </td>
                  <td class="price taL crc co2" style="padding-left: 8px">
                    <span class="b">전세</span
                    ><span class="eb" style="padding-left: 8px; font-size: 15px"
                      >6억 2,000</span
                    >
                  </td>
                  <td><span class="mm">59A</span></td>
                  <td class="aptNum">
                    <span class="aptdong">105동</span
                    ><span class="aptfloor">2층</span>
                  </td>
                </tr>
                <tr
                  style=""
                  onclick="clickPrice(this,20402255,1684,900049,908969,'1억 ','/138','103동','4층','22.0922')"
                >
                  <td class="date2"><span class="mm">22.09</span></td>
                  <td class=""><span class="dd">22</span></td>
                  <td class="days">
                    <img
                      src="/app/images/date_0.png"
                      style="width: 20px; height: 20px"
                    />
                  </td>
                  <td class="price taL crc co3" style="padding-left: 8px">
                    <span class="b">월세</span
                    ><span class="eb" style="padding-left: 8px; font-size: 15px"
                      >1억 /138</span
                    >
                  </td>
                  <td><span class="mm">59A</span></td>
                  <td class="aptNum">
                    <span class="aptdong">103동</span
                    ><span class="aptfloor">4층</span>
                  </td>
                </tr>
                <tr
                  style=""
                  onclick="clickPrice(this,20402255,1860,1800378,1809474,'2억 ','/170','106동','19층','22.0806')"
                >
                  <td class="date2"><span class="mm">22.08</span></td>
                  <td class=""><span class="dd">06</span></td>
                  <td class="days">
                    <img
                      src="/app/images/date_0.png"
                      style="width: 20px; height: 20px"
                    />
                  </td>
                  <td class="price taL crc co3" style="padding-left: 8px">
                    <span class="b">월세</span
                    ><span class="eb" style="padding-left: 8px; font-size: 15px"
                      >2억 /170</span
                    >
                  </td>
                  <td><span class="mm">59BC</span></td>
                  <td class="aptNum">
                    <span class="aptdong">106동</span
                    ><span class="aptfloor">19층</span>
                  </td>
                </tr>
                <tr
                  style=""
                  onclick="clickPrice(this,20402255,1791,1500196,1509223,'5억 7,000','','105동','8층','22.0723')"
                >
                  <td class="date2"><span class="mm">22.07</span></td>
                  <td class=""><span class="dd">23</span></td>
                  <td class="days">
                    <img
                      src="/app/images/date_0.png"
                      style="width: 20px; height: 20px"
                    />
                  </td>
                  <td class="price taL crc co2" style="padding-left: 8px">
                    <span class="b">전세</span
                    ><span class="eb" style="padding-left: 8px; font-size: 15px"
                      >5억 7,000</span
                    >
                  </td>
                  <td><span class="mm">59A</span></td>
                  <td class="aptNum">
                    <span class="aptdong">105동</span
                    ><span class="aptfloor">8층</span>
                  </td>
                </tr>
                <tr
                  style=""
                  onclick="clickPrice(this,20402255,1783,1500140,1509159,'5억 8,000','','105동','6층','22.0714')"
                >
                  <td class=""><span class="mm"></span></td>
                  <td class=""><span class="dd">14</span></td>
                  <td class="days">
                    <img
                      src="/app/images/date_0.png"
                      style="width: 20px; height: 20px"
                    />
                  </td>
                  <td class="price taL crc co2" style="padding-left: 8px">
                    <span class="b">전세</span
                    ><span class="eb" style="padding-left: 8px; font-size: 15px"
                      >5억 8,000</span
                    >
                  </td>
                  <td><span class="mm">59A</span></td>
                  <td class="aptNum">
                    <span class="aptdong">105동</span
                    ><span class="aptfloor">6층</span>
                  </td>
                </tr>
                <tr
                  style=""
                  onclick="clickPrice(this,20402255,1717,900280,909233,'6억 ','','103동','15층','22.0605')"
                >
                  <td class="date2"><span class="mm">22.06</span></td>
                  <td class=""><span class="dd">05</span></td>
                  <td class="days">
                    <img
                      src="/app/images/date_0.png"
                      style="width: 20px; height: 20px"
                    />
                  </td>
                  <td class="price taL crc co2" style="padding-left: 8px">
                    <span class="b">전세</span
                    ><span class="eb" style="padding-left: 8px; font-size: 15px"
                      >6억
                    </span>
                  </td>
                  <td><span class="mm">59A</span></td>
                  <td class="aptNum">
                    <span class="aptdong">103동</span
                    ><span class="aptfloor">15층</span>
                  </td>
                </tr>
                <tr
                  style=""
                  onclick="clickPrice(this,20402255,1721,900308,909265,'4억 6,200','','103동','16층','22.0603')"
                >
                  <td class=""><span class="mm"></span></td>
                  <td class=""><span class="dd">03</span></td>
                  <td class="days">
                    <img
                      src="/app/images/date_0.png"
                      style="width: 20px; height: 20px"
                    />
                  </td>
                  <td class="price taL crc co2" style="padding-left: 8px">
                    <span class="b">전세</span
                    ><span class="eb" style="padding-left: 8px; font-size: 15px"
                      >4억 6,200</span
                    >
                  </td>
                  <td><span class="mm">59BC</span></td>
                  <td class="aptNum">
                    <span class="aptdong">103동</span
                    ><span class="aptfloor">16층</span>
                  </td>
                </tr>
                <tr
                  style=""
                  onclick="clickPrice(this,20402255,1773,1200371,1209380,'2억 5,000','/100','104동','19층','22.0603')"
                >
                  <td class=""><span class="mm"></span></td>
                  <td class=""><span class="dd">03</span></td>
                  <td class="days">
                    <img
                      src="/app/images/date_0.png"
                      style="width: 20px; height: 20px"
                    />
                  </td>
                  <td class="price taL crc co3" style="padding-left: 8px">
                    <span class="b">월세</span
                    ><span class="eb" style="padding-left: 8px; font-size: 15px"
                      >2억 5,000/100</span
                    >
                  </td>
                  <td><span class="mm">59A</span></td>
                  <td class="aptNum">
                    <span class="aptdong">104동</span
                    ><span class="aptfloor">19층</span>
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

        <div class="type_area_wrap" style="z-index: 99999">
          <div class="type_area">
            <h2>차트 설정</h2>
            <a onclick="closeMenu();" class="btn_close">차트 설정 닫기</a>

            <h3 class="h3">종류</h3>
            <ul class="type">
              <li onclick="search2(this, '1')" id="selectM" class="on">
                <span>매매</span>
              </li>
              <li onclick="search2(this, '2')" id="selectJ" class="on">
                <span>전세</span>
              </li>
              <li onclick="search2(this, '3')" id="selectW" class="on">
                <span>월세</span>
              </li>
              <li onclick="search2(this, '4')" id="selectG" class="on">
                <span>건수</span>
              </li>
            </ul>
            <h3 class="h3 select_py">평형선택</h3>
            <ul class="area">
              <li onclick="search3(0, '51', '22'); closeMenu();">
                <div>
                  <div id="m2_0" class="m2Div">
                    <strong>22평</strong>
                    <span>전용 51㎡</span>
                  </div>
                </div>
              </li>

              <li onclick="search3(1, '59', '25'); closeMenu();">
                <div>
                  <div id="m2_1" class="m2Div on">
                    <strong>25평</strong>
                    <span>전용 59㎡</span>
                  </div>
                </div>
              </li>

              <li onclick="search3(2, '84', '32'); closeMenu();">
                <div>
                  <div id="m2_2" class="m2Div">
                    <strong>32평</strong>
                    <span>전용 84㎡</span>
                  </div>
                </div>
              </li>

              <li onclick="search3(3, '84', '33'); closeMenu();">
                <div>
                  <div id="m2_3" class="m2Div">
                    <strong>33평</strong>
                    <span>전용 84㎡</span>
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapActions } from "vuex";
const houseStore = "houseStore";

export default {
  name: "DealDetail",
  props: {
    code: String,
    apartName: String,
  },
  // data() {
  //   return {
  //     code: this.code,
  //     apartName: this.apartName,
  //   };
  // },
  mounted() {
    console.log(this.code);
    console.log(this.apartName);
    this.getAptDetail({ aptCode: this.code });
  },
  methods: {
    ...mapActions(houseStore, ["getAptDetail"]),
    close() {
      this.$emit("close");
    },
    mapChart() {
      var context = document.getElementById("myChart").getContext("2d");
      var myChart = new Chart(context, {
        type: "line", // 차트의 형태
        data: {
          // 차트에 들어갈 데이터
          labels: [
            //x 축
            "1",
            "2",
            "3",
            "4",
            "5",
            "6",
            "7",
          ],
          datasets: [
            {
              //데이터
              label: "test1", //차트 제목
              fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
              data: [
                21,
                19,
                25,
                20,
                23,
                26,
                25, //x축 label에 대응되는 데이터 값
              ],
              backgroundColor: [
                //색상
                "rgba(255, 99, 132, 0.2)",
                "rgba(54, 162, 235, 0.2)",
                "rgba(255, 206, 86, 0.2)",
                "rgba(75, 192, 192, 0.2)",
                "rgba(153, 102, 255, 0.2)",
                "rgba(255, 159, 64, 0.2)",
              ],
              borderColor: [
                //경계선 색상
                "rgba(255, 99, 132, 1)",
                "rgba(54, 162, 235, 1)",
                "rgba(255, 206, 86, 1)",
                "rgba(75, 192, 192, 1)",
                "rgba(153, 102, 255, 1)",
                "rgba(255, 159, 64, 1)",
              ],
              borderWidth: 1, //경계선 굵기
            } /* ,
                  {
                      label: 'test2',
                      fill: false,
                      data: [
                          8, 34, 12, 24
                      ],
                      backgroundColor: 'rgb(157, 109, 12)',
                      borderColor: 'rgb(157, 109, 12)'
                  } */,
          ],
        },
        options: {
          scales: {
            yAxes: [
              {
                ticks: {
                  beginAtZero: true,
                },
              },
            ],
          },
        },
      });
    },
  },
};
</script>

<style scoped lang="scss">
.open-detail {
  position: fixed;
  margin: 0;
  padding: 0;
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
    padding: 10px 10px 5px 10px;
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
</style>

