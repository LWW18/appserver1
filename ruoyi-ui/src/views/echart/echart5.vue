<template>
  <div class="counto">
    <div class="dataInfo">
      <div
        class="list"
        :style="{ background: item.color }"
        v-for="(item, index) in list"
        :key="index"
      >
        <div class="icon">
          <i :class="item.icon"></i>
        </div>
        <div class="title">
          <countTo
            :startVal="item.startVal"
            :endVal="item.endVal"
            :duration="item.duration"
          ></countTo>
          <span
            ><router-link :to="{ name: item.name }" class="text">
              {{ item.title }}</router-link>
              </span>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { listAppManagement } from "@/api/app/appManagement";
import { listTerminal } from "@/api/equ/terminal";
import { listGateway } from "@/api/equ/gateway";
import { listDataManagement } from "@/api/data/dataManagement";
import { listWarning } from "@/api/data/dataManagement";
import countTo from "vue-count-to";
export default {
  data() {
    return {
      list: [
        {
          title: "App数量",
          duration: 3000,
          endVal: null,
          startVal: 0,
          color:
            "linear-gradient(119deg, #39b8dc 0%, #4bbecc 40%, #5ac4bd 70%)",
          icon: "el-icon-document",
          name: "AppManagement",
        },
        {
          title: "终端数量",
          duration: 3000,
          endVal: null,
          startVal: 0,
          color:
            "linear-gradient(119deg, #09bafa 0%, #05a3e0 30%, #0080b6 70%)",
          icon: "el-icon-stopwatch",
          name: "Terminal",
        },
        {
          title: "预警数量",
          duration: 3000,
          endVal: null,
          startVal: 0,
          color:
            "linear-gradient(119deg, #ce5a40 0%, #e0706c 30%, #ec808c 60%)",
          icon: "el-icon-bell",
          name: "Warning",
        },
        {
          title: "网关数量",
          duration: 3000,
          endVal: null,
          startVal: 0,
          color:
            "linear-gradient(119deg, #7d7adc 0%, #a17eee 30%, #bf81ff 60%)",
          icon: "el-icon-postcard",
          name: "Gateway",
        },
        {
          title: "通信数据",
          duration: 3000,
          endVal: null,
          startVal: 0,
          color:
            "linear-gradient(119deg, #3c90e3 0%, #3e88dd 20%, #495abb 90%)",
          icon: "el-icon-data-analysis",
          name: "DataManagement",
        },
      ],
    };
  },
  components: { countTo },
  created() {
    this.getList();
  },
  methods: {
    getList() {
      listAppManagement(this.queryParams).then((response) => {
        this.list[0].endVal = response.total;
      });
      listTerminal(this.queryParams).then((response) => {
        this.list[1].endVal = response.total;
      });
      listWarning(this.queryParams).then((response) => {
        this.list[2].endVal = response.total;
      });
      listGateway(this.queryParams).then((response) => {
        this.list[3].endVal = response.total;
      });
      listDataManagement(this.queryParams).then((response) => {
        this.list[4].endVal = response.total;
      });
    },
  },
};
</script>

<style lang="css" scoped>
.dataInfo {
  text-align: center;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  align-items: center;
  margin-top: 10px;
  margin-bottom: 10px;
  user-select: none;
  height: 160px;
  /* width: 1715px; */
  width: 100%;
}

.dataInfo .list {
  box-sizing: border-box;
  height: 160px;
  border: 1px solid #ccc;
  border-radius: 8px;
  padding: 30px 0;
  margin: 0 10px;
  flex: 1;
}
.dataInfo .list:last-child {
  margin-right: 30px;
}
.dataInfo .list:first-child {
  margin-left: 25px;
}
.title span {
  font-size: 25px;
  display: block;
  font-weight: bold;
  color: #fff;
}

.icon i {
  font-size: 35px;
  color: #fff;
  font-weight: bold;
}
</style>
