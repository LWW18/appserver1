<template>
  <div>
    <div
      id="chart"
      :style="{ width: '400px', height: '180px', padding: '5px' }"
    ></div>
    <div class="right">
      <span class="chart-text">App总数量: {{ appNum }} 个</span><br />
      <span class="chart-text">已授权App数量: {{ authorized.length }} 个</span
      ><br />
      <span class="chart-text">未授权App数量: {{ unauthorized }} 个</span>
    </div>
  </div>
</template>

<script>
import { listAppManagement } from "@/api/app/appManagement";
export default {
  data() {
    return {
      appNum: null,
      authorized: [],
      unauthorized: null,
      authState: null,
      datas: [
        {
          value: 8,
          name: "已授权",
        },
        {
          value: 2,
          name: "未授权",
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
    listAppManagement(this.queryParams).then((response) => {
      this.appManagementList = response.rows;
      this.authorized = response.rows.filter(function (item) {
        return parseInt(item.authState) > 0;
      });
      this.unauthorized = response.total - this.authorized.length;
      this.appNum = response.total;
      this.datas.length = 0;
      var data = {
        value: this.authorized.length,
        name: "已授权",
      };
      var data1 = {
        
          value: this.unauthorized,
          name: "未授权",
          label: {
            show: false,
          },   
      }
      this.datas.push(data,data1)
    });
  },
  methods: {
    showChart() {
      var chart = this.$echarts.init(document.getElementById("chart"));
      var option = {
        color: ["#39b8dc", "#eeeeee"],
        title: {
          text: "授权情况",
          textStyle: {
            fontSize: 22,
          },
          left: "3%",
          top: "6%",
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
  left: 430px;
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