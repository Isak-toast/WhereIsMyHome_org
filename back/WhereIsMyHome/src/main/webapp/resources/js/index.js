const root = "./";

setList();

document.querySelector("#sido").addEventListener("change", setList);
document.querySelector("#gugun").addEventListener("change", setList);
document.querySelector("#btn-apt-month").addEventListener("click", onClickNavBtn);
document.querySelector("#btn-house-month").addEventListener("click", onClickNavBtn);
document.querySelector("#btn-apt-deal").addEventListener("click", onClickNavBtn);
document.querySelector("#btn-house-deal").addEventListener("click", onClickNavBtn);

async function setList() {
  setAptDealList();
  setHouseDealList();
}

// 지역코드를 통한 아파트 실거래 목록 출력 함수
async function setAptDealList() {
  // 최신 데이터 우선 가져오기
  let date = new Date();
  let dateStr = String(date.getFullYear() * 100 + date.getMonth());

  let num = 3; // 최종 가져올 데이터 개수
  const MAX_TERM = 6; // 최대 탐색 범위(개월)
  let html = `<h2>아파트 거래정보</h2>
  <a id="a-more-apt" href="#">전체보기</a>`;

  for (let i = 0; i < MAX_TERM; i++) {
    if (!num) break;
    await getAptDeal(dateStr).then((data) => {
      // console.log(data);
      if (!data) return;
      for (item of data) {
        if (num == 0) break;
        num--;
        html += `
        <div class="data-item">
        <div>
        <p>${item["아파트"]}</p>
        <p>${item["법정동"]} ・ ${item["전용면적"]}㎡</p>
        <p>${item["거래금액"]}만원</p>
        <p>${item["년"]}.${item["월"]}.${item["일"]}</p>
        </div>
        <div class="img-box">
        <img src="${root}${randomImgs[Math.floor(Math.random() * 2) + 2]}" alt="apartment">
        </div>
        </div>`;
      }
    });
    date.setMonth(date.getMonth() - 1);
    dateStr = String(date.getFullYear() * 100 + date.getMonth());
  }

  aptList.innerHTML = html;
  document.querySelector("#a-more-apt").addEventListener("click", onClickMoreBtn);
}

// 지역코드를 통한 주택 실거래 목록 출력 함수
async function setHouseDealList() {
  // 최신 데이터 우선 가져오기
  let date = new Date();
  let dateStr = String(date.getFullYear() * 100 + date.getMonth());

  let num = 3; // 최종 가져올 데이터 개수
  const MAX_TERM = 6; // 최대 탐색 범위(개월)
  let html = `<h2>주택 거래정보</h2>
              <a id="a-more-house" href="#">전체보기</a>`;

  for (let i = 0; i < MAX_TERM; i++) {
    if (!num) break;
    await getHouseDeal(dateStr).then((data) => {
      console.dir(data);
      if (!data) return;
      for (item of data) {
        if (num == 0) break;
        num--;
        html += `
            <div class="data-item">
                <div>
                <p>${item["주택유형"]}주택</p>
                <p>${item["법정동"]} ・ ${item["연면적"]}㎡</p>
                <p>${item["거래금액"]}만원</p>
                <p>${item["년"]}.${item["월"]}.${item["일"]}</p>
                </div>
                <div class="img-box">
                    <img src="${root}${randomImgs[Math.floor(Math.random() * 2)]}" alt="house">
                </div>
            </div>`;
      }
    });
    date.setMonth(date.getMonth() - 1);
    dateStr = String(date.getFullYear() * 100 + date.getMonth());
  }

  houseList.innerHTML = html;
  document.querySelector("#a-more-house").addEventListener("click", onClickMoreBtn);
}

// 정보조회 버튼 이벤트
function onClickNavBtn() {
  switch (this.id) {
    case "btn-apt-month":
      alert("준비중입니다.");
      break;

    case "btn-house-month":
      alert("준비중입니다.");
      break;

    case "btn-apt-deal":
      location.href = "pages/homeList.jsp?type=apartment";
      break;

    case "btn-house-deal":
      location.href = "pages/homeList.jsp?type=house";
  }
}

// 전체보기 버튼 이벤트
function onClickMoreBtn() {
  let params = sidoText === "전체" ? `` : `&sido=${sidoText}&gugun=${gugunText}`;
  switch (this.id) {
    case "a-more-apt":
      location.href = `pages/homeList.jsp?type=apartment${params}`;
    case "a-more-house":
      location.href = `pages/homeList.jsp?type=house${params}`;
  }
}
