/<template>
      <section class="container padding-none">
        <form class="address-form">
            <h2>지역을 선택해 주세요</h2>
            <div>
                <select class="form-control" name="sido" id="sido">
                    <option value="all">도/광역시</option>
                </select>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
                </svg>
            </div>
            
            <div>
                <select class="form-control" name="gugun" id="gugun">
                    <option value="all">시/구/군</option>
                </select>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
                </svg>
            </div>
        </form>

        <div class="data-container">
            <div class="apartment" id="data-list-apartment">
                <h2>아파트 거래정보</h2>
                <a id="a-more-apt" href="#">전체보기</a>
            </div>
            <div class="house" id="data-list-house">
                <h2>주택 거래정보</h2>
                <a id="a-more-house" href="#">전체보기</a>
            </div>
        </div>
    </section>
</template>

<script>
export default {
    name: "MainArea",
    
}
</script>

<style>
@import "@/resources/css/common.css";
@import "@/resources/css/main.css";
</style>