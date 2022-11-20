<template>
  <b-col class="map-wrap">
    <div class="kmap" ref="map"></div>
    <button class="mapBtn" @click="setBounds()">지도범위 재설정</button>
  </b-col>
  <!-- <b-container class="bv-example-row mt-3 text-center">
        <h3 class="underline-orange"><b-icon icon="house-fill"></b-icon> House Service</h3>
        <b-row>
      <b-col>
        <deal-search-bar></deal-search-bar>
      </b-col>
    </b-row>
    <b-row>
      <b-col cols="6">
        <deal-map></deal-map>
      </b-col>
      <b-col cols="2">
        <deeal-apt-list></deeal-apt-list>
      </b-col>
    </b-row>
  </b-container> -->
</template>

<script>
import { mapState, mapGetters, mapMutations } from "vuex";
import marker from "@/assets/home.png"

const houseStore = "houseStore";

export default {
  name: "DealMap",
  data() {
    return {
      kakao: null,
      map: null,
      mapLat: 35.850701,
      mapLng: 128.570667,
      marker: null,
    }
  },
  mounted() {
    this.kakao = window.kakao;

    var container = this.$refs.map;
    var options = {
      center: new this.kakao.maps.LatLng(this.mapLat, this.mapLng),
      level: 12,
    };
    this.map = new this.kakao.maps.Map(container, options);
    console.log(this.map);
    //마커 이미지의 이미지 크기 입니다
    var imageSize = new this.kakao.maps.Size(35, 35);
      // // 마커 이미지를 생성합니다
    this.marker = new this.kakao.maps.MarkerImage(marker, imageSize);
  },
  computed: {
    ...mapState(houseStore, ["apts"]),

  },
  methods: {
    ...mapGetters(houseStore, ["getAptList"]),
    ...mapMutations(houseStore, ["CLEAR_APT_LIST"]),
    setBounds() {
      // 버튼을 클릭하면 아래 배열의 좌표들이 모두 보이게 지도 범위를 재설정합니다
      const apts = this.getAptList();
      console.log(apts);
      var points = [];
      for (i = 0; i < apts.length; i++){
        points.push({
          title: apts[i].apartmentName,
          latlng: new this.kakao.maps.LatLng(apts[i].lat, apts[i].lng)
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
            marker = new this.kakao.maps.Marker(
              {
                position: points[i].latlng,
                title: points[i].title,
                image: this.marker
              });
            marker.setMap(this.map);

            // LatLngBounds 객체에 좌표를 추가합니다
            bounds.extend(points[i].latlng);
          }
          this.map.setBounds(bounds);
      }
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
      this.map.panTo(moveLatLon);
    },
  }
}
</script>

<style scoped>
.map-wrap {
  margin: 0;
  padding: 0;
  width: calc(100% - 390px);
  height: 100vh;
}

.map-wrap>.kmap {
  position: absolute;
  width: 100%;
  height: 100vh;
  margin: 0;
}
.mapBtn{
  position: sticky;
  z-index: 3;
}
</style>
