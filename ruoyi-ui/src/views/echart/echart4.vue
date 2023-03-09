<template>
  <div>
    <div
      class="echart-box"
      id="myChart2"
      :style="{ width: '100%', height: '380px', background: '#ffffff' }"
    ></div>
  </div>
</template>

<script>
import { terminalType } from "@/api/equ/terminal";
export default {
  data() {
    return {
      datay: [],
      id: undefined,
      state: undefined,
      battery: undefined,
    };
  },
  mounted: function () {
    this.drawLine(); //绘制图表
  },
  created() {
    terminalType(this.queryParams).then((response) => {
      // console.log(response);
      for (let i = 0; i < response.length; i++) {
        this.datay.push(response[i]);
      }
    });
  },
  watch: {
    datay: {
      handler: function () {
        this.drawLine();
      },
      deep: true,
    },
  },

  methods: {
    drawLine() {
      // 初始化echarts实例
      let myChart = this.$echarts.init(document.getElementById("myChart2"));
      // 构造图表数据
      let options = {
        title: {
          text: "传感器数量统计",
          left: "center",
        },
        tooltip: {
          trigger: "item",

        },
        xAxis: {
          name: "种类",
          nameTextStyle: {
            color: "black", 
            nameLocation: "start",
          },
          data: [
            "低功耗倾角" + "\n" + "传感器",
            "数字型" + "\n" + "加速度计",
            "多功能空气质量" + "\n" + "变送器",
            "压力式静力" + "\n" + "水准仪",
            "声光报警器",
          ],
          axisLabel: {
            interval: 0,
            rotate: 40,
          },
          textStyle: {
            color: "black",
            fontSize: "20",
          },
        },
        yAxis: {
          name: "数量（个）",
          nameTextStyle: {
            color: "black",
            nameLocation: "start",
          },
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
            name: "",
            data: this.datay,
            type: "bar",
            barWidth: "50%",
            emphasis: {
              itemStyle: {
                shadowBlur: 5,
                shadowOffsetX: 0,
                shadowColor: "rgba(0, 0, 0, 0.5)",
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
                  color: "#5ac4bd", // 0% 处的颜色
                },
                {
                  offset: 1,
                  color: "#ade2de", // 100% 处的颜色
                },
              ],
              global: false, // 缺省为 false
            },
          },
        ],
      };
      // 绘制图表
      myChart.setOption(options);
    },
  },
};
</script>
<style lang='css' scoped>
.echart-box {
  margin: 10px;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  width: 100%;
  height: 380px;
}
</style>
