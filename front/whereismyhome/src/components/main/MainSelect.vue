/<template>
  <b-container class="bv-example-row mt-3 text-center">
    <b-row>
          <div class="col-md-3">
            <div class="div-type">
                <div class="img-box">
                    <img src="@/resources/img/apartment-1.jpg" alt="img">
                </div>
                <div>
                    <div>
                        <h2>아파트/다세대</h2>
                        <span>전 · 월세</span>
                    </div>
                    <button id="btn-apt-month">
                        정보조회
                    </button>
                </div>
            </div>
          </div>
          <div class="col-md-3">
              <div class="div-type">
                  <div class="img-box">
                      <img src="@/resources/img/house-1.jpg" alt="img">
                  </div>
                  <div>
                      <div>
                          <h2>주택</h2>
                          <span>전 · 월세</span>
                      </div>
                      <button id="btn-house-month">
                          정보조회
                      </button>
                  </div>
              </div>
          </div>
          <div class="col-md-3">
              <div class="div-type">
                  <div class="img-box">
                      <img src="@/resources/img/apartment-2.jpg" alt="img">
                  </div>
                  <div>
                      <div>
                          <h2>아파트/다세대</h2>
                          <span>매매</span>
                      </div>
                      <button id="btn-apt-deal">
                          정보조회
                      </button>
                  </div>
              </div>
          </div>
          <div class="col-md-3">
              <div class="div-type">
                  <div class="img-box">
                      <img src="@/resources/img/house-2.jpg" alt="img">
                  </div>
                  <div>
                      <div>
                          <h2>주택</h2>
                          <span>매매</span>
                      </div>
                      <button id="btn-house-deal">
                          정보조회
                      </button>
                  </div>
              </div>
          </div>
      <b-col></b-col>
    </b-row>
  </b-container>
</template>

<script>
export default {
    name: "MainSelect",
    
}
</script>

<style>
@import "@/resources/css/common.css";
@import "@/resources/css/main.css";
</style>