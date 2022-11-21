<template>
  <b-col class="map-wrap">
    <div class="kmap" ref="map">
      <button class="zoom-in-btn" @click="zoomIn()">+</button>
      <button class="zoom-out-btn" @click="zoomOut()">-</button>
    </div>

    <span id="maplevel"></span>
  </b-col>
</template>

<script>
import { mapState, mapGetters, mapMutations } from "vuex";
import marker from "@/assets/apt_marker.png";

const houseStore = "houseStore";

export default {
  name: "DealMap",
  data() {
    return {
      kakao: null,
      map: null,
      marker: null,
      mapLat: 35.850701,
      mapLng: 128.570667,
    };
  },
  mounted() {
    console.log(this);
    console.log(this.$store.state.houseStore);
    this.kakao = window.kakao;

    var container = this.$refs.map;
    var options = {
      center: new this.kakao.maps.LatLng(this.mapLat, this.mapLng),
      level: 12,
    };
    this.map = new this.kakao.maps.Map(container, options);
    console.log(this.map);
    //마커 이미지의 이미지 크기 입니다
    var imageSize = new this.kakao.maps.Size(50, 50);
    // // 마커 이미지를 생성합니다
    this.marker = new this.kakao.maps.MarkerImage(marker, imageSize);
  },
  computed: {
    ...mapState(houseStore, ["apts"]),
  },
  watch: {
    apts: function () {
      this.setBounds();
    },
  },
  methods: {
    ...mapGetters(houseStore, ["getAptList"]),
    ...mapMutations(houseStore, ["CLEAR_APT_LIST"]),
    setBounds() {
      // 버튼을 클릭하면 아래 배열의 좌표들이 모두 보이게 지도 범위를 재설정합니다
      const apts = this.getAptList();
      console.log(apts);
      var points = [];
      for (i = 0; i < apts.length; i++) {
        points.push({
          title: apts[i].apartmentName,
          latlng: new this.kakao.maps.LatLng(apts[i].lat, apts[i].lng),
        });
      }
      // const set = new Set(points);
      console.log(points);
      if (this.apts.length != 0) {
        // 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
        var bounds = new this.kakao.maps.LatLngBounds();

        var i, marker;
        for (i = 0; i < points.length; i++) {
          // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
          marker = new this.kakao.maps.Marker({
            position: points[i].latlng,
            title: points[i].title,
            image: this.marker,
          });
          marker.setMap(this.map);

          // LatLngBounds 객체에 좌표를 추가합니다
          bounds.extend(points[i].latlng);
        }
        this.map.setBounds(bounds);
      }

      this.getInfo();
    },
    setCenter(mapLat, maptLng) {
      // 이동할 위도 경도 위치를 생성합니다
      var moveLatLon = new this.kakao.maps.LatLng(mapLat, maptLng);
      // 지도 중심을 이동 시킵니다
      this.map.setCenter(moveLatLon);
    },
    panTo(mapLat, maptLng) {
      // 이동할 위도 경도 위치를 생성합니다
      var moveLatLon = new this.kakao.maps.LatLng(mapLat, maptLng);
      // 지도 중심을 부드럽게 이동시킵니다
      // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
      console.log("이동");
      this.map.panTo(moveLatLon);
    },
    zoomIn() {
      // 현재 지도의 레벨을 얻어옵니다
      var level = this.map.getLevel();

      // 지도를 1레벨 내립니다 (지도가 확대됩니다)
      this.map.setLevel(level - 1);

      // 지도 레벨을 표시합니다
      this.displayLevel();
    },
    zoomOut() {
      // 현재 지도의 레벨을 얻어옵니다
      var level = this.map.getLevel();

      // 지도를 1레벨 올립니다 (지도가 축소됩니다)
      this.map.setLevel(level + 1);

      // 지도 레벨을 표시합니다
      this.displayLevel();
    },
    displayLevel() {
      console.log("현재 지도 레벨은 " + this.map.getLevel() + " 레벨 입니다.");
    },
    getInfo() {
      // 지도의 현재 중심좌표를 얻어옵니다
      var center = this.map.getCenter();

      // 지도의 현재 레벨을 얻어옵니다
      var level = this.map.getLevel();

      // 지도타입을 얻어옵니다
      var mapTypeId = this.map.getMapTypeId();

      // 지도의 현재 영역을 얻어옵니다
      var bounds = this.map.getBounds();

      // 영역의 남서쪽 좌표를 얻어옵니다
      var swLatLng = bounds.getSouthWest();

      // 영역의 북동쪽 좌표를 얻어옵니다
      var neLatLng = bounds.getNorthEast();

      // 영역정보를 문자열로 얻어옵니다. ((남,서), (북,동)) 형식입니다
      var boundsStr = bounds.toString();

      var message = "지도 중심좌표는 위도 " + center.getLat() + ", <br>";
      message += "경도 " + center.getLng() + " 이고 <br>";
      message += "지도 레벨은 " + level + " 입니다 <br> <br>";
      message += "지도 타입은 " + mapTypeId + " 이고 <br> ";
      message +=
        "지도의 남서쪽 좌표는 " +
        swLatLng.getLat() +
        ", " +
        swLatLng.getLng() +
        " 이고 <br>";
      message +=
        "북동쪽 좌표는 " +
        neLatLng.getLat() +
        ", " +
        neLatLng.getLng() +
        " 입니다";
      message += "박스 영역 좌표는 " + boundsStr + "입니다.";

      this.panTo(swLatLng.getLat(), swLatLng.getLng());
      // 개발자도구를 통해 직접 message 내용을 확인해 보세요.
      console.log(message);
    },
  },
};
</script>

<style scoped>
* {
  margin: 0;
  padding: 0;
}
.map-wrap {
  margin: 0;
  padding: 0;
  width: calc(100% - 390px);
  height: 100%;
  overflow: hidden;
  position: relative;
}

.map-wrap > .kmap {
  width: 100%;
  height: 100%;
  margin: 0;
}
.kmap > .zoom-in-btn {
  position: absolute;
  z-index: 2;
  border-radius: 20%;
  width: 20px;
  height: 20px;
  border: solid skyblue 1px;
  bottom: 30px;
  right: 10px;
}
.kmap > .zoom-out-btn {
  position: absolute;
  z-index: 2;
  border-radius: 20%;
  width: 20px;
  height: 20px;
  border: solid skyblue 1px;
  bottom: 10px;
  right: 10px;
}
</style>
