<template>
    <div class="deal-container">
        <deal-search-bar></deal-search-bar>
        <deal-map></deal-map>
    </div>
</template>

<script>
import DealSearchBar from "@/components/deal/DealSearchBar.vue";
import DealMap from "@/components/deal/DealMap.vue"

export default {
    name: "AppDeal",
    components: {
        DealSearchBar,
        DealMap,
    }
}
</script>

<style scoped>
    .deal-container{
        position: relative;
        display: flex;
        width: 100%;
        height: calc(100vh - 104px);
        margin: 0;
        overflow-y:hidden;
    }

</style>

