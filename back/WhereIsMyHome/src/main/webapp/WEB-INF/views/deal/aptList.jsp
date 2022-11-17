<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<link rel="stylesheet" href="${root}/resources/css/homeList.css" />
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/nav.jsp" %>
    <nav class="nav-type">
      <div class="container">
        <ul>
          <li><button id="btn-all">전체</button></li>
          <li><button id="btn-apartment">아파트/다세대</button></li>
          <li><button id="btn-house">주택</button></li>
        </ul>
      </div>
    </nav>
    <main class="map-section">
      <div id="map"></div>

      <form id="search-form" class="search-form" method="" action="">
        <div class="text-form">
          <input
            type="text"
            name="inputText"
            id="inputText"
            placeholder="아파트, 주택명을 입력하세요."
          />
          <input type="hidden" name="act" value="selectBtn" />
          <button type="button" id="btn-submit">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="16"
              height="16"
              fill="currentColor"
              class="bi bi-search"
              viewBox="0 0 16 16"
            >
              <path
                d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"
              />
            </svg>
          </button>
        </div>
        <div class="address-form">
          <h3>지역</h3>

          <div>
            <select
              class="form-control"
              name="sido"
              id="sido"
              onchange="getCode('gugun', this.value)"
            >
              <option value="all">도/광역시</option>
            </select>
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="16"
              height="16"
              fill="currentColor"
              class="bi bi-chevron-down"
              viewBox="0 0 16 16"
            >
              <path
                fill-rule="evenodd"
                d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"
              />
            </svg>
          </div>
          <div>
            <select
              class="form-control"
              name="gugun"
              id="gugun"
              onchange="getCode('dong', this.value)"
            >
              <option value="all">시/구/군</option>
            </select>
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="16"
              height="16"
              fill="currentColor"
              class="bi bi-chevron-down"
              viewBox="0 0 16 16"
            >
              <path
                fill-rule="evenodd"
                d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"
              />
            </svg>
          </div>
          <div>
            <select class="form-control" name="dong" id="dong">
              <option value="">읍/면/동</option>
            </select>
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="16"
              height="16"
              fill="currentColor"
              class="bi bi-chevron-down"
              viewBox="0 0 16 16"
            >
              <path
                fill-rule="evenodd"
                d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"
              />
            </svg>
          </div>
        </div>
      </form>
      <section class="section-data-list">
        <div class="data-address">
          <h3 id="select-address">전체</h3>
          <span class="btn-like" id="btn-like">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="16"
              height="16"
              fill="currentColor"
              class="bi bi-heart"
              viewBox="0 0 16 16"
            >
              <path
                d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"
              />
            </svg>
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="16"
              height="16"
              fill="currentColor"
              class="bi bi-heart-fill"
              viewBox="0 0 16 16"
            >
              <path
                fill-rule="evenodd"
                d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"
              />
            </svg>
          </span>
        </div>
        <div class="data-list" id="data-list"></div>

      </section>
      <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"
      ></script>
      <!-- <script type="text/javascript" src="${root}/resources/js/utils/bootstrap.js"></script> -->
      <script type="text/javascript" src="${root}/resources/js/utils/apiKeys.js"></script>
      <script type="text/javascript" src="${root}/resources/js/utils/const.js"></script>
      <script type="text/javascript" src="${root}/resources/js/utils/getAptDeal.js"></script>
      <script type="text/javascript" src="${root}/resources/js/utils/getHouseDeal.js"></script>
      <script type="text/javascript" src="${root}/resources/js/utils/map.js"></script>

    </main>
     <!-- 아파트 정보 모달 -->
    <div
    class="modal fade"
    id="aptViewModal"
    data-bs-backdrop="static"
    data-bs-keyboard="false"
    tabindex="-1"
    aria-labelledby="staticBackdropLabel"
    aria-hidden="true"
  >
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">아파트 정보</mark></h5>
          <button
            type="button"
            class="btn-close"
            data-bs-dismiss="modal"
            aria-label="Close"
          ></button>
        </div>
        <div class="modal-body">
          <table class="table table-bordered">
            <colgroup>
              <col width="120" />
              <col width="*" />
              <col width="120" />
              <col width="*" />
            </colgroup>
            <tbody>
              <tr></tr> 
                <th class="text-center">건축년도</th>
                <td class="text-left" id="dealYear"></td>
                <th class="text-center">월</th>
                <td class="text-left" id="dealMonth"></td>
                <th class="text-center">일</th>
                <td class="text-left" id="dealDay"></td>
              </tr>
              <tr>
                <th class="text-center">아파트 이름</th>
                <td class="text-left" id="apartmentName" colspan="3"></td>
                <th class="text-center">동</th>
                <td class="text-left" id="name" colspan="3"></td>
              </tr>
              <tr>
                <th class="text-center">평수</th>
                <td class="text-left" id="area" colspan="3"></td>
                <th class="text-center">가격(만원)</th>
                <td class="text-left" id="dealAmount" colspan="2"></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
    <script>
	   

      function getCode(type = "sido", code = "null") {
        if (type == "gugun") {
          document.getElementById("dong").options.length = 1;
        }
        fetch(`${pageContext.request.contextPath}/deal/\${type}/\${code}`)
          .then((response) => response.json())
          .then((items) => {
            let codeBox = document.getElementById(type);
            codeBox.options.length = 1;
            items.forEach(
              (item) => (codeBox.options[codeBox.options.length] = new Option(item.name, item.code))
            );
          });
      }
      getCode();

      
   	  // 버튼을 누르거나 엔터를 누르면 아파트 정보 불러옴
   		const MAX_LIST = 5;
      document.querySelector("#btn-submit").addEventListener("click", function () {
        loadAptInfo();
      });
      document.querySelector("#inputText").addEventListener("keydown", function (e) {
        if(e.keyCode === 13){ // 엔터키
          e.preventDefault();
          loadAptInfo();
        } 
      });
      function loadAptInfo(){
        let dongVal =  document.querySelector("#dong").value;
        let textVal =  document.querySelector("#inputText").value;
        let config = {
          method: "GET",
          headers: { "Content-Type": "application/json" },
          // body: JSON.stringify(aptInfo),
        }
        fetch(`${root}/deal?dongCode=\${dongVal}&aptText=\${textVal}`, config)
          .then((response) => response.json())
          .then((data) => {
        	  addAptList(data);
        	  printItem();
          });
      }

      let items = [];
      let items_stack = [];
      function addAptList(data){
        let cnt = 0;
        for (item of data) {
          if(cnt++ > MAX_LIST) break;
          items.push({
                id : Number(cnt),
                dealYear: Number(item["dealYear"]),
                dealMonth: Number(item["dealMonth"]),
                dealDay: Number(item["dealDay"]),
                aptName: item["apartmentName"],
                dongName: item["name"],
                area: Number(item["area"]),
                price: item["dealAmount"],
                type: 0,
          });
        }
      } 
      function printItem(){
    	  let html = "";
    	  for (item of items) {
          console.log(item)
    	    html += `
    	    <div class="data-item" ondblclick="showModal(\${item.id})" data>
    	      <div class="img-box">
    	          <img src="${root}/\${randomImgs[parseInt(Math.floor(Math.random() * 4))]}" alt="apartment">
    	      </div>
    	      <div>
    	        <p>\${item.aptName}</p>
    	        <p>\${item.dongName}</p>
    	      </div>
    	    </div>`;
    	  }
        items_stack = [...items]; // spread operator
    	  items = []
    	  document.querySelector(`#data-list`).innerHTML = html;
      }
      function showModal(aptId){
        console.log(aptId);

	    	var modal = new bootstrap.Modal(document.getElementById("aptViewModal"), {
          backdrop: true,
          keyboard: false,
        });
        const aptInfo = items_stack.find(items_stack => items_stack.id === aptId) 
        // console.log(aptInfo)
        document.querySelector("#dealYear").innerText = aptInfo.dealYear;
        document.querySelector("#dealMonth").innerText = aptInfo.dealMonth;
        document.querySelector("#dealDay").innerText = aptInfo.dealDay;
        document.querySelector("#apartmentName").innerText = aptInfo.aptName;
        document.querySelector("#name").innerText = aptInfo.dongName;
        document.querySelector("#area").innerText = aptInfo.area;
        document.querySelector("#dealAmount").innerText = aptInfo.price;
        modal.show();
	    }
      
    </script>
  </body>
</html>
