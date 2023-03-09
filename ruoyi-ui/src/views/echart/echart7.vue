<template>
  <div>
    <div id="list" style="width: 725px; height: 20px">
      <span class="text">App访问量</span>
      <ul v-for="item in 2" :key="item" @click="changedata(item)">
        <li class="change">
          <el-button type="primary" icon="el-icon-edit" circle>{{item}}</el-button>
        </li>
      </ul>
    </div>
    <div id="box" style="width: 735px; height: 330px"></div>
  </div>
</template>

<script>
import Vue from "vue";
import echarts from "echarts";
Vue.use(echarts);
export default {
  data() {
    return {
      data: [],
      icon: ['el-icon-document','el-icon-stopwatch'],
      data2: ["172", "193", "301", "374", "275", "211", "354"],
      data1: ["6234", "5764", "4349", "3974", "4732", "5324", "5940","4360","3902","3308"],
    };
  },
  mounted() {
    this.drawLine();
    this.drawLine1();
  },
  methods: {
    changedata(item) {
      console.log(item);
      if (item == 1) {
        this.data = this.data1;
        this.drawLine1();
      }
      if (item == 2) {
        this.data = this.data2;
       
        this.drawLine();
      }
    },
    drawLine() {
      var myChart = echarts.init(document.getElementById("box"));
      var optoin = {
        legend: {
          data: ["近七日访问量"],
          left: "center",
        },
        xAxis: {
          type: "category",
          boundaryGap: false,
          data: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
        },
        yAxis: {
          type: "value",
        },
        series: [
          {
            data: this.data,
            areaStyle: {},
            type: "line",
          },
        ],
      };
      myChart.setOption(optoin);
    },
    drawLine1() {
      var myChart = echarts.init(document.getElementById("box"));
      var optoin = {
        legend: {
          data: ["近三十日访问量"],
        },
        xAxis: {
          type: "category",
          boundaryGap: false,
          data: ["3", "6", "9", "12", "15", "18", "21", "24", "27", "30"],
        },
        yAxis: {
          type: "value",
          axisLine: {
            //坐标轴
            show: false,
          },
          axisTick: {
            //刻度线
            show: false,
            alignWithLabel: true,
          },
        },
        series: [
          {
            data: this.data,
            areaStyle: {},
            type: "line",
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
      myChart.setOption(optoin);
    },
  },
};
</script>

<style scoped>
.text {
  margin-top: 13px;
  display: block;
  text-align: center;
  font-size: 19px;
  font-weight: bold;
}
.change {
  display: inline;
  float: right;
  margin-right: 30px;
}
#box {
  margin-top: 40px;
}
</style>

