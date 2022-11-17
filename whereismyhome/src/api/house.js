import { apiInstance, houseInstance } from "./index.js";

const api = apiInstance();
const house = houseInstance();

function sidoList(params, success, fail) {
  console.log(params);
  api.get(`/deal/${params.type}/null`).then(success).catch(fail);
}

function gugunList(params, success, fail) {
  api.get(`/deal/${params.type}/${params.code}`).then(success).catch(fail);
}

function houseList(params, success, fail) {
  house.get(``, { params: params }).then(success).catch(fail);
}

export { sidoList, gugunList, houseList };
