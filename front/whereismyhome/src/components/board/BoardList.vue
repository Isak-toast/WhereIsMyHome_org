<template>
  <v-main>
    <the-tab></the-tab>
    <v-container>
      <h1>자유 게시판</h1>
      <v-simple-table>
        <template v-slot:default>
          <thead>
            <tr>
              <th v-for="header in headers" :key="header" class="text-h6">{{ header }}</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="article in articles" :key="article.articleNo" height="70">
              <board-list-item v-for="article in articles" :key="article.articleNo" v-bind="article"></board-list-item>
            </tr>
          </tbody>
        </template>
      </v-simple-table>
      <the-pagination></the-pagination>
    </v-container>
  </v-main>
</template>

<script>
import http from "@/api/lib/http";
import TheTab from "@/components/layout/TheTab.vue";
import ThePagination from "@/components/layout/ThePagination.vue";

export default {
  name: "BoardList",
  data() {
    return {
      headers: ["No", "제목", "작성자", "조회수", "작성일"],
      articles: [],
    };
  },
  created() {
    http.get("/board").then((res) => {
      console.log(res.data);
      this.articles = res.data;
    });
  },
  methods: {},
  components: {
    TheTab,
    ThePagination,
  },
};
</script>

<style></style>
