<template>
  <v-main>
    <the-tab></the-tab>
    <v-container>
      <h1>공지사항</h1>
      <v-simple-table>
        <template v-slot:default>
          <thead>
            <tr>
              <th class="text-left text-h6 font-weight-black">No</th>
              <th class="text-center text-h6 font-weight-black">제목</th>
              <th class="text-left text-h6 font-weight-black">등록일</th>
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="article in articles"
              :key="article.articleNo"
              height="70"
            >
              <td>{{ article.articleNo }}</td>
              <td>{{ article.title }}</td>
              <td>{{ article.updatedDate }}</td>
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
  name: "NoticeList",
  data() {
    return {
      articles: [],
    };
  },
  created() {
    http.get("/board").then((res) => {
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
