<template>
  <div class="back">
    <div class="top">
      <div>大厅已服务监视 {{watchTime.toFixed(1)}} 小时 (h)</div>
      <img src="" alt="">
      <div class="title">资源共享监视平台</div>
      <img src="" alt="">
      <div class="time">
        <div>{{time}}</div>
        <div>{{date}}</div>
      </div>
      <div @click="toPageBack">返回<img src="" width="30px" alt=""></div>
      <div @click="fullScreen(screenAll)">
        <span v-if="screenAll == 0">进入全屏</span>
        <span v-if="screenAll == 1">退出全屏</span>
      </div>
    </div>
    <el-row>
      <el-col :span="15">
        <div class="item-left-top">
          <div><echart2 :width='380' :height='250' :leftText="chart2Text" :digitalData="digitalData"
            style="padding-top: 20px;"></echart2></div>
          <div>
            <div>轮播广告图点击量</div>
            <div>100</div>
            <div>昨日点击&nbsp;&nbsp;&nbsp;100</div>
            <div>对比点击&nbsp;&nbsp;&nbsp;0</div>
          </div>
          <div>
            <div>在线用户</div>
            <div>100</div>
            <div>平台资源数&nbsp;&nbsp;&nbsp;100</div>
            <div>今日资源点击量&nbsp;&nbsp;90008</div>
          </div>
        </div>
        <div class="item-left-bottom">
          <div>
            <p>活跃用户前五所在城市</p>
            <echart3 :width='340' :height='340' :radius='80' :leftText="chart3Text" :digitalData="digitalData2"></echart3>
          </div>
          <div>
            <p>活跃用户前五所在城市</p>
            <table border="1" cellpadding="0" cellspacing="0" width="90%" class="table1">
              <tr height="50px" align="center" style="font-size:15px;">
                <td>分类</td>
                <td>名称</td>
                <td>下载量</td>
              </tr>
              <tr v-for="(item, index) in tableData1" :key="index" height="40px" align="center">
                <td>{{item.sortName}}</td>
                <td>{{item.title}}</td>
                <td>{{item.downloadNum}}</td>
              </tr>
            </table>
          </div>
        </div>
      </el-col>
      <el-col :span="9">
        <div class="item-right">
          <p>近七天资源下载量</p>
          <echart1 :width='400' :height='280' :xAxisText="xAxisText1"
            :xFontColor="'#FFFFFF'" :digitalData="digitalData1"></echart1>
          <p>排名前 8 资源 <br> 更新于2020-06-11</p>
          <table border="1" cellpadding="0" cellspacing="0" width="90%" class="table2">
            <tr height="50px" align="center" style="font-size:15px;">
              <td>分类</td>
              <td>名称</td>
              <td>下载量</td>
            </tr>
            <tr v-for="(item, index) in tableData1" :key="index" height="40px" align="center">
              <td>{{item.sortName}}</td>
              <td>{{item.title}}</td>
              <td>{{item.downloadNum}}</td>
            </tr>
          </table>
        </div>
      </el-col>
    </el-row>
  </div>
</template>
 
<script>
import moment from 'moment'
import echart1 from '../views/echart/echart1.vue'
import echart2 from '../views/echart/echart2.vue'
import echart3 from '../views/echart/echart3.vue'
export default {
  components: {
    echart1,
    echart2,
    echart3
  },
  data () {
    return {
      screenAll: 0, // 0退出全屏, 1全屏
      time: '',
      watchTime: 0,
      digitalData1: [1, 2, 3, 4, 10, 5, 1],
      xAxisText1: ['07-18', '07-19', '07-20', '07-21', '07-22', '07-23', '07-24'],
      chart2Text: ['广州市', '佛山市', '深圳市', '上海市', '北京市'],
      digitalData: [
        {value: 200, name: '广州市'},
        {value: 100, name: '佛山市'},
        {value: 100, name: '深圳市'},
        {value: 50, name: '上海市'},
        {value: 50, name: '北京市'}
      ],
      chart3Text: ['广州市', '佛山市', '深圳市', '上海市', '北京市'],
      digitalData2: [
        {value: 200, name: '广州市'},
        {value: 100, name: '佛山市'},
        {value: 100, name: '深圳市'},
        {value: 50, name: '上海市'},
        {value: 50, name: '北京市'}
      ],
      tableData1: [{sortName: '电影', title: '唐人街探案 II', downloadNum: 1866},
        {sortName: '电影', title: '唐人街探案 II', downloadNum: 1866},
        {sortName: '电影', title: '唐人街探案 II', downloadNum: 1866},
        {sortName: '电影', title: '唐人街探案 II', downloadNum: 1866},
        {sortName: '电影', title: '唐人街探案 II', downloadNum: 1866}]
    }
  },
  mounted () {
    this.timer = setInterval(() => { // 更新小时时间
      this.time = moment().format('HH:mm:ss')
    }, 1000)
    this.watchTimer = setInterval(() => { // 更新监测时间
      this.watchTime += 0.1
    }, 360000)
  },
  beforeDestroy () { // 清除定时器
    if (this.timer) {
      clearInterval(this.timer)
    }
    if (this.watchTimer) {
      clearInterval(this.watchTimer)
    }
  },
  methods: {
    toPageBack () {
      this.$router.go(-1)
    },
    fullScreen () { // # 全屏显示
      if (this.screenAll === 1) {
        this.screenAll = 0
        if (document.exitFullscreen) {
          document.exitFullscreen()
        } else if (document.webkitCancelFullScreen) {
          document.webkitCancelFullScreen()
        } else if (document.mozCancelFullScreen) {
          document.mozCancelFullScreen()
        } else if (document.msExitFullscreen) {
          document.msExitFullscreen()
        }
      } else {
        this.screenAll = 1
        if (document.documentElement.requestFullscreen) {
          document.documentElement.requestFullscreen()
        } else if (document.documentElement.webkitRequestFullScreen) {
          document.documentElement.webkitRequestFullScreen()
        } else if (document.documentElement.mozRequestFullScreen) {
          document.documentElement.mozRequestFullScreen()
        } else if (document.documentElement.msRequestFullscreen) {
          // IE11
          document.documentElement.msRequestFullscreen()
        }
      }
    }
  },
  computed: {
    date () {
      return moment().format('YYYY 年 MM 月 DD 日')
    }
  }
}
</script>
 
<style lang="scss" scoped>
tr:hover{
  background: #030237;
}
.back{
  background: #030237;
  width: 100%;
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  font-size: 18px;
  overflow-x: hidden;
  color: #5A95DA;
  .top{
    width: 100%;
    height: 60px;
    line-height: 60px;
    color: #4471A6;
    // background: #050297;
    border-bottom: 2px solid #4471A6;
    display: flex;
    align-items: center;
    justify-content: center;
    min-width: 1400px;
    position: relative;
    div:first-child{
      position: relative;
      left: -3%;
    }
    img:nth-child(2){
      width: 250px;
      height: 40px;
      margin-left: 2%;
    }
    img:nth-child(4){
      width: 250px;
      height: 40px;
    }
    .title{
      width: 280px;
      background-image: url('../assets/logo/logo.png');
      background-size: 100% 100%;
      background-repeat: no-repeat;
      text-align: center;
    }
    .time{
      width: 200px;
      height: 50px;
      line-height: 25px;
      display: flex;
      flex-direction: column;
      div{
        text-align: center;
        font-weight: 600;
        font-size: 18px;
        font-family: Digital;
      }
    }
    div:nth-child(6){
      cursor: pointer;
      img{
        position: relative;
        top: 5px;
        margin-left: 5px;
      }
    }
    div:last-child{
      font-size: 12px;
      margin-left: 2%;
      cursor: pointer;
    }
    div:last-child:hover{
      color: cyan;
    }
  }
  .el-row{
    .item-left-top{
      width: 100%;
      height: 350px;
      display: flex;
      justify-content: center;
      align-items: center;
      // background: crimson;
      div{
        width: 26%;
        height: 280px;
        // background: cornflowerblue;
        margin: auto;
        display: flex;
        flex-direction: column;
        position: relative;
        left: 1%;
      }
      div:first-child{
        width: 400px;
        height: 280px;
      }
      div:nth-child(2), div:last-child{
        animation: dh1 5s;
        -webkit-animation: dh1 5s; /* Safari and Chrome */
        div{
          width: 100%;
          display: flex;
          justify-content: center;
          text-align: center;
          font-family: digital;
        }
        div:nth-child(2){
          font-size: 80px;
          padding: 30px 0;
          color: #D3EDFF;
        }
        div:nth-child(3), div:last-child{
          text-align: left;
          text-indent: 30px;
        }
      }
    }
    .item-left-bottom{
      width: 96%;
      height: 400px;
      margin: auto;
      border: 2px solid #0094FF;
      border-radius: 10px;
      margin-bottom: 30px;
      background-image: radial-gradient(#1A2D5E 5%, #000337 70%);
      display: flex;
      justify-content: center;
      align-items: center;
      animation: dh2 2s;
      -webkit-animation: dh2 2s; /* Safari and Chrome */
      animation-delay: 2s;
      animation-fill-mode: both;
      div{
        height: 380px;
        // background: crimson;
        margin: 0 10px;
        p{
          position: relative;
          top: 30px;
        }
      }
      div:first-child{
        width: 340px;
        display: flex;
        flex-direction: column;
        align-items: center;
        div{
          position: relative;
          bottom: 8%;
          animation: dh4 2s;
          -webkit-animation: dh4 2s; /* Safari and Chrome */
          animation-delay: 3s;
          animation-fill-mode: both;
        }
      }
      div:last-child{
        flex: 1;
        display: flex;
        flex-direction: column;
        align-items: center;
      }
      .table1{
        position: relative;
        top: 50px;
        border: 1px solid #5A95DA;
        font-size: 12px;
        animation: dh4 2s;
        -webkit-animation: dh4 2s; /* Safari and Chrome */
        animation-delay: 5s;
        animation-fill-mode: both;
      }
    }
    .item-right{
      width: 90%;
      height: 700px;
      margin: 40px auto;
      border: 2px solid #0094FF;
      border-radius: 10px;
      background-image: linear-gradient(to top, #1A2D5E, #000337);
      animation: dh3 2s;
      -webkit-animation: dh3 2s; /* Safari and Chrome */
      animation-delay: 4s;
      animation-fill-mode: both;
      div{
        position: relative;
        left: 5%;
        animation: dh4 2s;
        -webkit-animation: dh4 2s; /* Safari and Chrome */
        animation-delay: 6s;
        animation-fill-mode: both;
      }
      .table2{
        border: 1px solid #5A95DA;
        font-size: 12px;
        margin: 30px auto;
        animation: dh4 2s;
        -webkit-animation: dh4 2s; /* Safari and Chrome */
        animation-delay: 7s;
        animation-fill-mode: both;
      }
      p{
        padding-top: 40px;
        font-size: 15px;
        text-align: center;
      }
      p:first-child{
        padding-top: 20px;
        margin: 0;
      }
    }
  }
}
// 渐变效果
@keyframes dh1{
  from {opacity: 0;}
  to {opacity: 1;}
}
 
// 上移效果
@keyframes dh2{
  from {opacity: 0; position: relative;top: 100px;}
  to {opacity: 1; position: relative; top: 0;}
}
 
// 左移效果
@keyframes dh3{
  from {opacity: 0; position: relative;left: 500px;}
  to {opacity: 1; position: relative; left: 0;}
}
 
// 缩放出现效果
@keyframes dh4{
  from {opacity: 0; transform: scale(0,0);}
  to {opacity: 1; transform: scale(1,1);}
}
</style>