import { apiInstance, houseInstance } from "./index.js";

const api = apiInstance();  // 서버 REST API -> MYSQL DB
const house = houseInstance(); // DATA.go API

function sidoList(params, success, fail) {
  console.log(params);
  api.get(`/deal/${params.type}/null`).then(success).catch(fail);
}

function gugunList(params, success, fail) {
  api.get(`/deal/${params.type}/${params.code}`).then(success).catch(fail);
}

function dongList(params, success, fail) {
  api.get(`/deal/${params.type}/${params.code}`).then(success).catch(fail);
}

function aptList(params, success, fail) {
  api.get(`/deal`, { params: params }).then(success).catch(fail);
}

function houseList(params, success, fail) {
  house.get(``, { params: params }).then(success).catch(fail);
}


export { sidoList, gugunList, dongList, aptList, houseList };

