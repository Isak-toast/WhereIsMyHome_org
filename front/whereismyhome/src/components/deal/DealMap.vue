/<template>
    <div>
        <div class="kmap" ref="map" id="kmap">
            <deal-search-bar></deal-search-bar>
            <deal-apt-list></deal-apt-list>
        </div>
    </div>
    <!-- <b-container class="bv-example-row mt-3 text-center">
        <h3 class="underline-orange"><b-icon icon="house-fill"></b-icon> House Service</h3>
        <b-row>
      <b-col>
        <deal-search-bar></deal-search-bar>
      </b-col>
    </b-row>
    <b-row>
      <b-col cols="6">
        <deal-map></deal-map>
      </b-col>
      <b-col cols="2">
        <deeal-apt-list></deeal-apt-list>
      </b-col>
    </b-row>
  </b-container> -->
</template>

<script>
import DealSearchBar from "@/components/deal/DealSearchBar.vue";
import DealAptList from "@/components/deal/DealAptList.vue"

export default {
    name: "DealMap",
    components: {
        DealSearchBar,
        DealAptList,
    },
    mounted() {
        let kakao = window.kakao;
        console.log(this.$refs.map); 

        var container = this.$refs.map;
        var options = {
            center: new kakao.maps.LatLng(33.450701, 126.570667),
            level: 6,
        };
        const mapInstance = new kakao.maps.Map(container, options);
        console.log(mapInstance);
    }
}
</script>

<style>
    .kmap {
        position: fixed;
        top: 120px;
        width: 100%;
        height: 100vh;
    }
</style>
