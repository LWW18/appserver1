<template>
  <div class="box" ref="box" style="width: 730px; height: 400px" />
</template>

<script>
import echarts from "echarts";
import { listPageViews } from "@/api/data/dataManagement";
require("echarts/theme/macarons"); // echarts theme

export default {
  data() {
    return {
      datay: [],
      
    };
  },
  mounted() {
    this.$nextTick(() => {
      this.initChart();
    });
  },
  created() {
    listPageViews(this.queryParams).then((response) => {
      for (let i = 0; i < response.length; i++) {
        this.datay.push(response[i]);
      }
    });
  },
  watch: {
    datay: {
      handler: function () {
        this.initChart();
      },
      deep: true,
    },
  },
  methods: {
       
    getTime(){
      let dd = new Date().getDate();
      console.log(dd);
    },

    initChart() {
      let chart = echarts.init(this.$refs.box, "macarons");
 
      let option = {
        title: {
          text: "App访问量",
          left: "center",
          top: "3%",
          textStyle: {
            //标题内容的样式
            fontSize: 19,
            color: "black",
            fontWeight: "bold",
          },
        },
        tooltip: {
          trigger: "axis",
          axisPointer: {
            // 坐标轴指示器，坐标轴触发有效
            type: "shadow", // 默认为直线，可选为：'line' | 'shadow'
          },
        },
        legend: {
          data: ["近七日访问量"],
          x: "right",
          y: "top",
          padding: [45, 100, 0, 0],
        },
        xAxis: {
          data: [
            "星期一",
            "星期二",
            "星期三",
            "星期四",
            "星期五",
            "星期六",
            "星期日",
          ],
        },
        yAxis: {
          name: "数量（次）",
          nameTextStyle: {
            color: "black",
            nameLocation: "start",
          },
        },
        toolbox: {
          // 工具箱
          show: true,
          feature: {
            dataView: { readOnly: false },
            magicType: { type: ["bar", "line"] },
            restore: {},
          },
        },
        series: [
          {
            name: "近七日访问量",
            type: "line",
            stack: "vistors",
            barWidth: "60%",
            // data: [172, "193", "301", "374", "275", "211", "354"],
            data: this.datay,
            markLine: {
              data: [{ type: "average", name: "平均值" }],
              label: {
                position: "end",
                formatter: "{b}：\n" + "{c}",
              },
            },
            color: {
              x: 0,
              y: 0,
              x2: 0,
              y2: 1,
              colorStops: [
                {
                  offset: 0,
                  color: "#39b8dc", // 0% 处的颜色
                },
                {
                  offset: 1,
                  color: "#4bbecc", // 100% 处的颜色
                },
              ],
              global: false, // 缺省为 false
            },
          },
        ],
      };
      // 使用刚指定的配置项和数据显示图表。
      chart.setOption(option);
    },
    resetCharts() {
      this.$echarts.init(this.$refs.box).resize();
    },
  },
};
</script>
<style lang="css" scoped>
.chart {
  /* display: flex;
  flex-wrap: wrap; */
  /* justify-content: space-between; */
  width: 100%;
  height: 400px;
}
</style>

