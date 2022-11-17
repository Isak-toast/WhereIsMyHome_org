/<template>
    <b-container>     
        <div class="mt-3">
                <!-- notice start -->
            <b-card-group deck class="mb-3">
                <b-card border-variant="light" header="공지사항" class="text-center">
                    <b-card-text>

                    </b-card-text>
                </b-card>
                <!-- notice end -->

                <!-- board start -->
                <b-card border-variant="light" header="자유 게시판" class="text-center">
                    <b-card-text>
                        
                    </b-card-text>
                </b-card>
                <!-- board end -->
            </b-card-group>
        </div>

        <template>
            <div>
                <h2 class="text-left">부동산 뉴스</h2>
                <b-table :items="items" :fields="fields">
                <template #table-caption>This is a table caption.</template>
                </b-table>
            </div>
        </template>
    </b-container>
</template>

<script>
export default {
    name: "MainNotice",
    data() {
      return {
        items: [
          { age: 40, first_name: 'Dickerson', last_name: 'Macdonald' },
          { age: 21, first_name: 'Larsen', last_name: 'Shaw' },
          { age: 89, first_name: 'Geneva', last_name: 'Wilson' },
          { age: 38, first_name: 'Jami', last_name: 'Carney' }
        ]
      }
    }
}
</script>

<style>
@import "@/resources/css/common.css";
@import "@/resources/css/main.css";
</style>