<template>
  <div class="app-box">
    <div
      id="chart2"
      :style="{ width: '400px', height: '180px', padding: '5px' }"
    ></div>
    <div>
      <div class="right">
        <span class="chart-text">预警总数量:  {{ warningList.length }}  条</span
        ><br />
        <span class="chart-text">立库监测预警数量:  {{ warningList.length }}  条</span
        ><br />
        <!-- <span class="chart-text">XX预警数量:  {{ }}  条</span> -->
      </div>
    </div>
  </div>
</template>

<script>
import { listAllData } from "@/api/data/dataManagement";
export default {
  data() {
    return {
      allNum: null,
      warningList: [],
      warningFlag : null,
      safe: null,
      datas: [
        {
          value: 435,
          name: "预警",
        },
        {
          value: 310,
          name: "安全",
          label: {
            show: false,
          },
        },
      ],
    };
  },
  mounted() {
    this.showChart();
  },
  watch: {
    datas: {
      handler: function () {
        this.showChart();
      },
      deep: true,
    },
  },
  created() {
    listAllData(this.queryParams).then((response) =>
    {
      this.warningList = response.rows.filter(function (item) {
        return item.warningFlag > 0;
      })
      this.safe = response.total - this.warningList.length;
        console.log(this.safe);

      this.datas.length = 0;
      var data = {
        value: this.safe,
        name: "安全",
        label: {
            show: false,
          },
      };
      var data1 = {
          value: this.warningList.length,
          name: "预警",
      }
      this.datas.push(data1,data);
    });
  },
  methods: {
    showChart() {
      var chart = this.$echarts.init(document.getElementById("chart2"));
      var option = {
        color: ["#ec808c", "#eeeeee"],
        title: {
          text: "预警情况",
          textStyle: {
            fontSize: 22,
          },
          left: "2%",
          top: "5%",
        },
        series: [
          {
            name: "数据展示",
            type: "pie",
            radius: ["50%", "70%"],
            left: "50px",
            avoidLabelOverlap: false,
            hoverAnimation: false, //关闭放大动画
            selectedOffset: 0, //选中块的偏移量
            label: {
              show: true,
              position: "center",
              formatter: "{d}%",
              fontSize: "20",
              fontWeight: "bold",
            },
            emphasis: {
              label: {
                show: true,
                fontSize: "20",
                fontWeight: "bold",
              },
            },
            labelLine: {
              show: false,
            },
            data: this.datas,
          },
        ],
      };

      chart.setOption(option);
    },
  },
};
</script>
<style lang='css' scoped>
.right {
  position: absolute;
  top: 40px;
  left: 25%;
  width: 360px;
  height: 180px;
}
.chart-text {
  display: inline-block;
  font-size: 18px;
  font-weight: bold;
  margin: 10px 0;
  color: rgba(100, 99, 99, 0.753);
}
</style>
