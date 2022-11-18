import axios from "axios";

// axios 객체 생성
export default axios.create({
  // baseURL: "http://192.168.120.61:8099",
  baseURL: "http://localhost:8099",
  headers: {
    "Content-Type": "application/json;charset=utf-8",
  },
});
