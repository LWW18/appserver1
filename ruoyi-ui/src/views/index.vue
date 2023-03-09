<template>
  <div id="app">
    <div id="AppText">
      <span class="App">AppServer 总体数据情况</span>
      <span class="time">{{ time }}</span>
    </div>
      <div class="echart5"><echart5></echart5></div>
      <div class="echart1"><echart1></echart1></div>
      <div class="echart6"><echart6></echart6></div>
      <!-- <div class="echart4"><echart4></echart4></div> -->
      <div class="echart8"><echart8></echart8></div>
      <div class="echart9"><echart9></echart9></div>

  </div>
</template>

<script>
import echart1 from "../views/echart/echart1.vue";
import echart2 from "../views/echart/echart2.vue";
import echart3 from "../views/echart/echart3.vue";
import echart4 from "../views/echart/echart4.vue";
import echart5 from "../views/echart/echart5.vue";
import echart6 from "../views/echart/echart6.vue";
import echart7 from "../views/echart/echart7.vue";
import echart8 from "../views/echart/echart8.vue";
import echart9 from "../views/echart/echart9.vue";

var that = this;
export default {
  data() {
    return {
      time: "2021年10月27日 10:29",
    };
  },
  components: {
    echart1,
    echart2,
    echart3,
    echart4,
    echart5,
    echart6,
    echart7,
    echart8,
    echart9,
  },
  mounted() {
    this.currentTime();
  },
  methods: {
    //   时间
    currentTime() {
      setInterval(this.getTime, 500);
    },
    getTime() {
      let yy = new Date().getFullYear();
      let mm = new Date().getMonth() + 1;
      let dd = new Date().getDate();
      let hh = new Date().getHours();
      let mf =
        new Date().getMinutes() < 10
          ? "0" + new Date().getMinutes()
          : new Date().getMinutes();
      let ss =
        new Date().getSeconds() < 10
          ? "0" + new Date().getSeconds()
          : new Date().getSeconds();
      this.time =
        yy + "年 " + mm + "月" + dd + "日 " + hh + ":" + mf + ":" + ss;
    },

    animationFinished() {
      this.percent = this.percentNum;
      this.animationing = false;
      clearInterval(this.timeId);
      this.$emit("animationFinished");
    },
  },
};
</script>

<style lang='css' scoped>
.container {
  height: calc(100vh - 35px);
  overflow-y: scroll;
  max-width: 100vw;
  padding: 0;
}
::-webkit-scrollbar {
  width: 0 !important;
}
::-webkit-scrollbar {
  width: 0 !important;height: 0;
}

#AppText {
  width: 100%;
  height: 68px;
  /* border: 1px solid lightblue; */
  /*background-color: #3373ef;*/
  /*background-origin: 'linear-gradient(119deg, #0cb7c9 0%, #10c7bb 20%, #15dfa9 44%)';*/
  /* background-color: #2c3e50; */
  background-color: #0093e9;
  background-image: linear-gradient(160deg, #0093e9 0%, #80d0c7 100%);
  margin-bottom: 10px;
  line-height: 68px;
}
.time {
  margin-left: 65%;
  font-size: 17px;
  color: white;
  font-weight: bold;
}
.App {
  margin-left: 30px;
  font-size: 30px;
  color: white;
  font-weight: bold;
}

.echart1 {
  height: 400px;
  /* width: 500px; */
  width: 100%;
  background: white;
  border-radius: 25px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  position: absolute;
  left: 740px;
  margin-top: 405px;
}

.echart5 {
  height: 180px;
  /* width: 1745px; */
  width: 100%;
  border-radius: 25px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  position: absolute;
}
.echart6 {
  height: 400px;
  /* width: 100%; */
  width: auto;
  border-radius: 25px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  position: absolute;
  margin-top: 405px;
}
.echart4 {
  height: 400px;
  /* width: 100%; */
  border-radius: 25px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  position: absolute;
  bottom: 0;
  left: 1240px;
}
.echart8 {
  height: 207px;
  width: 868px;
  /* width: 100%; */
  margin-top: 190px;
  border-radius: 25px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  position: absolute;
}
.echart9 {
  height: 207px;
  /* width: 868px; */
  width: 100%;
  margin-top: 190px;
  left: 878px;
  border-radius: 25px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  position: absolute;
}
</style>
