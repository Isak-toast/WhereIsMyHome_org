<template>
  <div>
    <Bar
      :chart-options="chartOptions"
      :chart-data="chartData"
      :chart-id="chartId"
      :dataset-id-key="datasetIdKey"
      :plugins="plugins"
      :css-classes="cssClasses"
      :styles="styles"
      :width="width"
      :height="height"
    />
    <button @click="setLabel">OOO</button>
  </div>
</template>
  
  <script>
import { Bar } from "vue-chartjs";
import {
  Chart as ChartJS,
  Title,
  Tooltip,
  Legend,
  BarElement,
  CategoryScale,
  LinearScale,
} from "chart.js";

// import { mapState } from "vuex";
// const houseStore = "houseStore";

ChartJS.register(
  Title,
  Tooltip,
  Legend,
  BarElement,
  CategoryScale,
  LinearScale
);

export default {
  name: "DealChar",
  components: { Bar },
  props: {
    aptDetails: {
      type: Array,
      required: true,
    },
    chartId: {
      type: String,
      default: "bar-chart",
    },
    datasetIdKey: {
      type: String,
      default: "label",
    },
    width: {
      type: Number,
      default: 400,
    },
    height: {
      type: Number,
      default: 400,
    },
    cssClasses: {
      default: "",
      type: String,
    },
    styles: {
      type: Object,
      default: () => {},
    },
    plugins: {
      type: Object,
      default: () => {},
    },
  },
  mounted() {
    console.log("차트 선언");
    // console.log(this.aptDetails);
    this.setLabel;
  },
  data() {
    return {
      chartData: {
        // labels: ["January", "February", "March"],
        // datasets: [{ data: [40, 20, 12] }],
      },
      chartOptions: {
        responsive: true,
      },
    };
  },
  methods: {
    setLabel() {
      this.aptDetails;
      
      var labels = [];
      var datasets = [{ data: [] }];

      this.chartData = { labels: labels, datasets: datasets };
    },
  },
};
</script>