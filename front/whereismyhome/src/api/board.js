import { apiInstance } from "./index";

const api = apiInstance();
const board = "/board";

function listArticle(param, success, fail) {
  api.get(`${board}`, { params: param }).then(success).catch(fail);
}


function countListSize(param, success, fail) {
  api.get(`${board}/count`, { params: param }).then(success).catch(fail);
}

function getArticle(articleNo, success, fail) {
  api.get(`${board}/${articleNo}`).then(success).catch(fail);
}


function writeArticle(article, success, fail) {
  api.post(`${board}`, JSON.stringify(article)).then(success).catch(fail);
}

function modifyArticle(article, success, fail) {
  api.put(`${board}`, JSON.stringify(article)).then(success).catch(fail);
}

function updateHit(article, success, fail) {
  api.put(`${board}/hit`, JSON.stringify(article)).then(success).catch(fail);
}

function updateLike(article, success, fail) {
  api.put(`${board}/like`, JSON.stringify(article)).then(success).catch(fail);
}

// /{articleNo}
function deleteArticle(articleNo, success, fail) {
  api.delete(`${board}/${articleNo}`).then(success).catch(fail);
}

export { listArticle, countListSize, getArticle, writeArticle, modifyArticle, updateHit, updateLike, deleteArticle };
