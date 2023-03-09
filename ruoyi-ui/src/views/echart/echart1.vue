<template>
  <div
    class="echart-box"
    id="myChart1"
    :style="{ width: '850px', height: '380px', background: '#ffffff' }"
  ></div>
</template>

<script>
import { runStateList } from "@/api/equ/terminal";
export default {
  data() {
    return {
      // 定义图表，各种参数
      msg: "扇形图",
      datas: [
        { value: 20, name: "在线" },
        { value: 80, name: "离线" },
      ],
    };
  },
  mounted: function () {
    this.drawLine(); //按照默认值绘制图表
  },
  created() {
    runStateList(this.queryParams).then((response) => {
      response.push("在线");
      response.push("离线");
      // console.log(response);
      this.datas.length = 0; //清空数组
      var item = {
        value: response[0],
        name: response[2],
      };
      var item1 = {
        value: response[1],
        name: response[3],
      };
      this.datas.push(item, item1);
      // console.log(this.datas);
    });
  },
  watch: {
    datas: {
      handler: function () {
        this.drawLine();
      },
      deep: true,
    },
  },
  methods: {
    drawLine() {
      // 1、基于准备好的dom，初始化echarts实例
      let myChart = this.$echarts.init(document.getElementById("myChart1"));
      //2、构造图表数据
      let options = {
        title: {
          text: "终端状态",
          left: "center",
          top: "20px",
          textStyle: {
            //标题内容的样式
            fontSize: 20, 
          },
        },
        tooltip: {
          trigger: "item",
          formatter: "{a} <br/>{b} : {c} ({d}%)",
        },
        legend: {
          orient: "vertical",
          left: "80px",
          top: "20px",
          data: ["在线", "离线"],
        },
        series: [
          {
            name: "数据展示",
            type: "pie",
            radius: "55%",
            center: ["50%", "50%"],
            color: ["#65c5e5", "#b5a4eb"],
            data: this.datas,
            emphasis: {
              itemStyle: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: "rgba(0, 0, 0, 0.5)",
              },
            },
          },
        ],
      };
      // 3、绘制图表
      myChart.setOption(options);
    },
  },
};
</script>
<style lang="css" scoped>
.echart-box {
  margin-left: 10px;
  margin-top: 10px;
}
</style>
