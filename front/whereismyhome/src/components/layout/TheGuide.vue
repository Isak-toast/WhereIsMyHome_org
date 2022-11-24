<template>
  <v-container class="mb-16">
    <h1 class="my-5">하늘땅 별땅이 알려주는 부동산 가이드</h1>
    <v-row>
      <v-col>
        <v-card class="mx-auto" min-height="300">
          <v-card-text>
            <p class="text-h5 text--primary">하늘땅 별땅 이야기</p>
            <div class="text--primary">
              <a href="">허위매물 예방 5계명</a>
            </div>
          </v-card-text>

          <v-card-actions>
            <v-btn text color="deep-purple accent-4"> Learn More </v-btn>
          </v-card-actions>
        </v-card>
      </v-col>

      <v-col>
        <v-card class="mx-auto" min-height="300">
          <v-card-text>
            <p class="text-h5 text--primary">하늘땅 별땅 이야기</p>
            <div class="text--primary">
              <a href="">하늘땅 별땅으로 나에게 꼭 맞는 방 찾는 방법</a>
            </div>
          </v-card-text>

          <v-card-actions>
            <v-btn text color="deep-purple accent-4"> Learn More </v-btn>
          </v-card-actions>
        </v-card>
      </v-col>

      <v-col>
        <v-card class="mx-auto" min-height="300">
          <v-card-text>
            <p class="text-h5 text--primary">하늘땅 별땅 이야기</p>
            <div class="text--primary"><a href="">하늘땅 별땅으로 아파트 청약 정보 한번에 보기!</a></div>
          </v-card-text>

          <v-card-actions>
            <v-btn text color="deep-purple accent-4"> Learn More </v-btn>
          </v-card-actions>
        </v-card>
      </v-col>

      <v-col>
        <v-card class="mx-auto" min-height="300">
          <v-card-text>
            <p class="text-h5 text--primary">부동산 상식</p>
            <div class="text--primary"><a href="">알아두면 좋은 부동산 용어, 행복주택 기본용어!</a></div>
          </v-card-text>

          <v-card-actions>
            <v-btn text color="deep-purple accent-4"> Learn More </v-btn>
          </v-card-actions>
        </v-card>
      </v-col>

      <v-col>
        <v-card class="mx-auto" min-height="300">
          <v-card-text>
            <p class="text-h5 text--primary">부동산 상식</p>
            <div class="text--primary">
              <a href="">임대차 계약서 작성 시 이것만 알아두세요!</a>
            </div>
          </v-card-text>

          <v-card-actions>
            <v-btn text color="deep-purple accent-4" class="detail-btn"> Learn More </v-btn>
          </v-card-actions>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  name: "TheGuide",
  data: () => ({
    justify: ["start", "center", "end", "space-around", "space-between"],
  }),
};
</script>

<style>
.detail-btn {
  position: relative;
  bottom: 0;
}
</style>
