const imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
const mapContainer = document.getElementById("map"); //지도를 담을 영역의 DOM 레퍼런스

let map = null;
let clusterer = null;
let geocoder = null;
let imageSize = null;
let markerImage = null;
let markers = [];

document.write(
  `<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${keys.kakao}&libraries=services"></script>`
);
this.onload = () => {
  let options = {
    //지도를 생성할 때 필요한 기본 옵션
    center: new kakao.maps.LatLng(37.5, 127), //지도의 중심좌표.
    level: 10, //지도의 레벨(확대, 축소 정도)
  };
  map = new kakao.maps.Map(mapContainer, options); //지도 생성 및 객체 리턴
  geocoder = new kakao.maps.services.Geocoder();
  imageSize = new kakao.maps.Size(24, 35);
  markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
  setMapLocation();
};

// 선택한 지역으로 이동 함수
function setMapLocation() {
  if (sidoText === "전체") {
    map.setCenter(new kakao.maps.LatLng(37.5, 127));
    map.setLevel(10);
  } else {
    let keyword = `${sidoText} ${gugunText}`;

    var callback = function (result, status) {
      if (status === kakao.maps.services.Status.OK) {
        map.setCenter(new kakao.maps.LatLng(result[0].y, result[0].x));
        map.setLevel(7);
      }
    };
    geocoder.addressSearch(keyword, callback);
  }
}

// 마커 생성 함수
function setMapMarker(items) {
  markers.forEach((marker) => {
    marker.setMap(null);
  });
  markers = [];

  let regStr = `${sidoText} ${gugunText}`;
  if (sidoText === "전체") regStr = "서울특별시 종로구";

  items.forEach((item) => {
    let keyword = `${regStr} ${item.address}`;

    var callback = function (result, status) {
      if (status === kakao.maps.services.Status.OK) {
        let marker = new kakao.maps.Marker({
          map: map, // 마커를 표시할 지도
          position: new kakao.maps.LatLng(result[0].y, result[0].x), // 마커를 표시할 위치
          title: item.name, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
          image: markerImage, // 마커 이미지
        });
        markers.push(marker);
      }
    };
    geocoder.addressSearch(keyword, callback);
  });
}
