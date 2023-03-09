<template>
  <div>
    <div
      class="recentlyReportScollList"
      style="width: 600px; height:  400px; background: white"
    >
      <div
        style="
          background-color: #ffffff;
          border: none;
          border-radius: 4px;
          width: 100%;
          height: 4px;
        "
      ></div>
      <p style="margin: 12px 8px">
        <router-link
          :to="{ name: 'AppManagement' }"
          class="around"
          style="font-size: 18px; font: bold; padding: 0 0 0 8px"
          >App数据统计</router-link
        >
      </p>
      <dv-scroll-board
        :config="config"
        style="width: 96%; height: 340px; padding: 0 0 4px 18px"
      />
    </div>
  </div>
</template>

<script>
import { listAppManagement } from "@/api/app/appManagement";
export default {
  data() {
    return {
      config: {
        header: ["名称", "公司", "日期"],
        color:'#000000',
        headerBGC: "#3373ef",
        oddRowBGC: "#73A4FF",
        evenRowBGC: "#ffffff",
        waitTime: 2000,
        align: ["center", "center", "center"],
        data: [],
        carousel: "single",
        rowHeight: "20px",
        headerHeight: 45,
      },
    };
  },
  mounted() {
    this.recentReportList();
  },
  methods: {
    //调接口处
    recentReportList() {
      listAppManagement(this.queryParams).then((response) => {
        this.appManagementList = response.rows;
        let arrlistresult = [];
        this.appManagementList.map((item) => {
          let arrlist = [item.appName, item.company, item.createTime];
          arrlistresult.push(arrlist);
        });
        //动态渲染完后变成了对象的形式  并非数组
        this.config = {
          header: ["名称", "公司", "日期"],
          color:'#000000',
          headerBGC: "#3373ef",
          oddRowBGC: "#73A4FF",
          evenRowBGC: "#ffffff",
          align: ["center", "center", "center"],
          waitTime: 2000,
          data: arrlistresult,
          carousel: "single",
          headerHeight: 45,
        };
      });
    },
  },
};
</script>
<style lang='css' scoped>
.recentlyReportScollList {
  /* border: 1px solid gray; */
  border-radius: 25px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
}
</style>
