<template>
    <b-container class="bv-example-row mt-3">
      <b-row>
        <b-col>
          <b-alert show><h3>글목록</h3></b-alert>
        </b-col>
      </b-row>
      <b-row class="mb-1">
        <b-col class="text-right">
          <b-button variant="outline-primary" @click="moveWrite()">글쓰기</b-button>
        </b-col>
      </b-row>
      <b-row>
        <b-col>
          <b-table striped hover :items="articles" :fields="fields" @row-clicked="viewArticle">
            <template #cell(subject)="data">
              <router-link :to="{ name: 'boarddetail', params: { articleNo: data.item.articleNo } }">
                {{ data.item.subject }}
              </router-link>
            </template>
          </b-table>
        </b-col>
      </b-row>
    </b-container>
  </template>

  <script>
  // import http from "@/api/lib/http";
  import { listArticle } from "@/api/board";

  export default {
    name: "BoardList",
    data() {
      return {
        articles: [],
        fields: [
          { key: "articleNo", label: "글번호", tdClass: "tdClass" },
          { key: "title", label: "제목", tdClass: "tdSubject" },
          { key: "nickname", label: "작성자", tdClass: "tdClass" },
          { key: "registeredDate", label: "작성일", tdClass: "tdClass" },
          { key: "views", label: "조회수", tdClass: "tdClass" },
        ],
      };
    },
  created() {
      listArticle(
        ({ data }) => {
          console.log(data)
          this.articles = data;
        },
        (error) => {
          alert(error);
          // console.log(error);
        }
      );
      // http.get(`/board`).then(({ data }) => {
      //   console.log(data);
      //   this.articles = data;
      // });
  },
    methods: {
      moveWrite() {
        this.$router.push({ name: "boardwrite" });
      },
      viewArticle(article) {
        this.$router.push({
          name: "boarddetail",
          params: { articleNo: article.articleNo },
        });
      },
    },
  };
  </script>

  <style scope>
  .tdClass {
    width: 50px;
    text-align: center;
  }
  .tdSubject {
    width: 300px;
    text-align: left;
  }

  </style>
