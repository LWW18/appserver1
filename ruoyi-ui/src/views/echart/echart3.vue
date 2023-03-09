<template>
  <div id="pie">
    <dv-charts :option="option" class="charts"></dv-charts>
    
  </div>
</template>

<script>
import { terminalType } from "@/api/equ/terminal";
export default {
  data() {
    return {
      option: {
        //背景图颜色设置
        backgroundColor: "#031d33",
        color: ["#003B8E", "#1564BF", "#5F91F2", "#92B8FF"],
        title: {
          //title的名字
          text: "资源占用",
          offset: [0, -10], //设置title偏移量 也就位置
          style: {
            fill: "black",
            fontSize: 20,
          },
        },
        tooltip: {
          // 悬停指示
          trigger: "item",
          formatter: "{b}: {c} ({d}%)",
        },
        legend: {
          //控制是否显示legend,默认为true
          show: true,
          data: [{ name: "测试", icon: "line" }],
          orient: "horizontal", //控制legend的位置
        },
        series: [
          {
            //跟legend属性对应
            name: "测试",
            type: "pie", //图形所占大小比
            radius: ["42%", "63%"],
            center: ["50%", "50%"],
            roseType: true,
            roseSort: true,
            data: [
              { value: 21, name: "1" },
              { value: 32, name: "2" },
              { value: 32, name: "3" },
              { value: 32, name: "4" },
            ],
            outsideLabel: {
              //是否显示指示线
              show: true,
              style: {
                //修改字体大小
                fontSize: 14, //修改字体颜色，若是不设置，则显示饼图环对应颜色 //fill："red"
              }, //自定义标签返回内容
              formatter: (params) => {
                return Math.round(params.percent) + "%";
              },
              labelLineBendGap: 21, //标签线弯曲点与饼图的间距
              labelLineEndLength: 10, //标签线末端长度
              labelLineStyle: {
                lineWidth: 1, //标签线宽度
              },
            },
          },
        ],
      },
    };
  },
  created() {
    terminalType(this.queryParams).then((response) => {
      // console.log(response);
      for (let i = 0; i < response.length; i++) {
        this.datay.push(response[i]);
      }
    });
  },
};
</script>
<style lang='css' scoped>
.charts {
  height: 400px;
  width: 500px;
}
</style>
