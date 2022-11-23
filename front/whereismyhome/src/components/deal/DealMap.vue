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
import img from "@/assets/ssafy_logo.png";

const houseStore = "houseStore";

export default {
  name: "DealMap",
  data() {
    return {
      kakao: null,
      map: null,
      marker: null,
      markers: [],
      mapLat: 35.850701,
      mapLng: 128.570667,
      img: img,
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
    // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
    var mapTypeControl = new this.kakao.maps.MapTypeControl();

    // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
    // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
    this.map.addControl(
      mapTypeControl,
      this.kakao.maps.ControlPosition.TOPRIGHT
    );

    // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
    var zoomControl = new this.kakao.maps.ZoomControl();
    this.map.addControl(zoomControl, this.kakao.maps.ControlPosition.RIGHT);

    //마커 이미지의 이미지 크기 입니다
    var imageSize = new this.kakao.maps.Size(60, 60);
    // // 마커 이미지를 생성합니다
    this.marker = new this.kakao.maps.MarkerImage(marker, imageSize);
  },
  computed: {
    ...mapState(houseStore, ["apts"]),
  },
  watch: {
    apts: function () {
      // this.test();
      console.log("아파트 변경")
      console.log(this.apts);
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
      if (apts.length === 0) {
        console.log("아피트 실거래 데이터가 없습니다.");
        return;
      }
      // 아파트 데이터와 오버레이로 부터 맵 객체를 만든다.
      var points = [];
      var contents = this.getCustomOverlay();
      console.log(contents);
      this.mapLat = apts[0].lat;
      this.mapLng = apts[0].lng;
      for (i = 0; i < apts.length; i++) {
        points.push({
          content: contents,
          title: apts[i].apartmentName,
          latlng: new this.kakao.maps.LatLng(apts[i].lat, apts[i].lng),
        });
      }
      // 현재 표시되어 있는 marker들을 map에서 없앤다.
      this.removeMarkers();
      // const set = new Set(points);
      console.log(points);
      // this.removeMarker();
      if (this.apts.length != 0) {
        // 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
        // var bounds = new this.kakao.maps.LatLngBounds();
        var i, marker;
        var overlay = new this.kakao.maps.CustomOverlay({ zIndex: 1 }),
          //생성할 element
          contentNode = document.createElement("div");
        //마커정보

        for (i = 0; i < points.length; i++) {
          // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
          marker = new this.kakao.maps.Marker({
            position: points[i].latlng,
            title: points[i].title,
            image: this.marker,
          });
          marker.setMap(this.map);
          this.markers.push(marker);
          console.log(marker.getPosition());
          var place = {
            x: marker.getPosition().La,
            y: marker.getPosition().Ma,
          };

          this.kakao.maps.event.addListener(marker, "mouseover", () => {
            var content =
              " var content = '<div >' " +
              '   <a class="title" href="' +
              '" target="_blank" title="' +
              '">' +
              "</a>";

            content +=
              '    <span class="tel">' +
              "</span>" +
              "</div>" +
              '<div class="after"></div>';
            contentNode.innerHTML += content;
            console.log(contentNode);
            console.log(overlay);
            overlay.setPosition(new this.kakao.maps.LatLng(place.x, place.y));
            overlay.setMap(this.map);
          });

          overlay.setContent(contentNode);
          //   // LatLngBounds 객체에 좌표를 추가합니다
          //   bounds.extend(points[i].latlng);
          //   console.log(marker.getPosition());
          //   // 마커에 표시할 인포윈도우를 생성합니다
          //   // var overlay = new this.kakao.maps.CustomOverlay({
          //   //   content: points[i].content, // 인포윈도우에 표시할 내용
          //   //   map: this.map,
          //   //   position: marker.getPosition(),
          //   // });
          //   (function(marker) {
          //         kakao.maps.event.addListener(marker, 'click', function() {
          //             displayPlaceInfo(place);
          //         });
          //     })(marker, places[i]);

          //   // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
          //   // 이벤트 리스너로는 클로저를 만들어 등록합니다
          //   // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
          //   var vueThis = this;
          //   this.kakao.maps.event.addListener(marker, "click", () => {
          //     console.log(this);
          //     console.log(vueThis);
          //     console.log(marker);
          //     overlay.setMap(this.map);
          //   });
          //   this.kakao.maps.event.addListener(marker, "mouseout", () => {
          //     console.log(marker);
          //   });
          // }
          // this.map.setBounds(bounds);
        }
        overlay.setContent(contentNode);
        // var overlay = new this.kakao.maps.CustomOverlay({
        //       //생성할 element
        //   content: document.createElement("div"),
        //       //마커정보
        //     markers: markers
        // });

        // this.panTo(this.mapLat, this.mapLng);
        // this.getInfo();
      }
    },
    makeOverListener(map, marker, overlay) {
      return function () {
        // infowindow.open(map, marker);
        marker.addListener("mouseover", function () {
          overlay.setMap(map);
        });
      };
    },
    makeOutListener(overlay) {
      return function () {
        // infowindow.close();
        marker.addListener("mouseout", function () {
          overlay.setMap(null);
        });
      };
    },
    getCustomOverlay() {
      return `<div class="overlay">
            <div class="info">
                <div class="title">
                    카카오 스페이스닷원
               </div>
                <div class="body">
                    <div class="img">
                        <img src="${this.img}" width="73" height="70">
                   </div>
                    <div class="desc">
                        <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>
                        <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>
                   </div>
               </div>
           </div>
        </div>`;
    },
    removeMarkers() {
      for (var i = 0; i < this.markers.length; i++) {
        this.markers[i].setMap(null);
      }
    },
    setCenter(mapLat, mapLng) {
      if (mapLat == null || mapLng == null) return;
      // 이동할 위도 경도 위치를 생성합니다
      var moveLatLon = new this.kakao.maps.LatLng(mapLat, mapLng);
      this.map.setLevel(4); // 레벨 변경
      // 지도 중심을 이동 시킵니다
      this.map.setCenter(moveLatLon);
    },
    panTo(mapLat, mapLng) {
      if (mapLat == null || mapLng == null) return;
      // 이동할 위도 경도 위치를 생성합니다
      var moveLatLon = new this.kakao.maps.LatLng(mapLat, mapLng);
      this.map.setLevel(4); // 레벨 변경
      // 지도 중심을 부드럽게 이동시킵니다
      // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
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

      // this.panTo(swLatLng.getLat(), swLatLng.getLng());
      // 개발자도구를 통해 직접 message 내용을 확인해 보세요.
      console.log(message);
    },
  },
};
</script>

<style scoped lang="scss">
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

.overlay {
  position: absolute;
  left: 0;
  bottom: 40px;
  width: 288px;
  height: 132px;
  margin-left: -144px;
  text-align: left;
  overflow: hidden;
  font-size: 12px;
  font-family: "Malgun Gothic", dotum, "돋움", sans-serif;
  line-height: 1.5;
}
.overlay * {
  padding: 0;
  margin: 0;
}
.overlay .info {
  width: 286px;
  height: 120px;
  border-radius: 5px;
  border-bottom: 2px solid #ccc;
  border-right: 1px solid #ccc;
  overflow: hidden;
  background: #fff;
}
.overlay .info:nth-child(1) {
  border: 0;
  box-shadow: 0px 1px 2px #888;
}
.info .title {
  padding: 5px 0 0 10px;
  height: 30px;
  background: #eee;
  border-bottom: 1px solid #ddd;
  font-size: 18px;
  font-weight: bold;
}
.info .close {
  position: absolute;
  top: 10px;
  right: 10px;
  color: #888;
  width: 17px;
  height: 17px;
  background: url("@/assets/apt.png");
}
.info .close:hover {
  cursor: pointer;
}
.info .body {
  position: relative;
  overflow: hidden;
}
.info .desc {
  position: relative;
  margin: 13px 0 0 90px;
  height: 75px;
}
.desc .ellipsis {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
.desc .jibun {
  font-size: 11px;
  color: #888;
  margin-top: -2px;
}
.info .img {
  position: absolute;
  top: 6px;
  left: 5px;
  width: 73px;
  height: 71px;
  border: 1px solid #ddd;
  color: #888;
  overflow: hidden;
}
.info:after {
  content: "";
  position: absolute;
  margin-left: -12px;
  left: 50%;
  bottom: 0;
  width: 22px;
  height: 12px;
  background: url("https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png");
}
.info .link {
  color: #5085bb;
}
// .overlay {
//   position: absolute;
//   left: 0;
//   bottom: 40px;
//   width: 2808px;
//   height: 132px;
//   margin-left: -144px;
//   text-align: left;
//   overflow: hidden;
//   font-size: 12px;
//   font-family: "Malgun Gothic", dotum, "돋움", sans-serif;
//   line-height: 1.5;
// }

// .overlay > * {
//   margin: 0;
//   padding: 0;
// }

// .overlay > .info:nth-child(1) {
//   border: 0;
//   box-shadow: 0px 1px 2px #888;
// }

// .overlay > .info {
//   width: 286px;
//   height: 120px;
//   border-radius: 5px;
//   border-bottom: 2px solid #ccc;
//   border-right: 1px solid #ccc;
//   overflow: hidden;
//   background: #fff;
// }

// .overlay > .title {
//   padding: 5px 0 0 10px;
//   height: 30px;
//   background: #eee;
//   border-bottom: 1px solid #ddd;
//   font-size: 18px;
//   font-weight: bold;
// }

// .overlay > .info > .body {
//   position: relative;
//   overflow: hidden;
// }
</style>
