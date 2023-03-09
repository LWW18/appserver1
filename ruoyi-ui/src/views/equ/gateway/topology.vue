<template>
  <div class="app-container">
    <el-alert
    class="info"
    :title="title"
    type="info"
    show-icon>
  </el-alert>
    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:gateway:export']"
          >导出</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-close"
          size="mini"
          @click="handleClose"
          >返回</el-button
        >
      </el-col>
      <right-toolbar
        :showSearch.sync="showSearch"
        @queryTable="getEuiList"
      ></right-toolbar>
    </el-row>
    <el-table
      v-loading="loading"
      :data="getEuiList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="终端EUI" align="center" prop="terminalEui" />
      <el-table-column label="传感器ID" align="center" prop="sensorId" />
      <el-table-column label="App名称" align="center" prop="appName" />
      <el-table-column label="传感器类型" align="center" prop="sensorType">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.data_type"
            :value="scope.row.sensorType"
          />
        </template>
      </el-table-column>
      <el-table-column label="运行状态" align="center" prop="runState">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.terminal_runstate"
            :value="scope.row.runState"
          />
        </template>
      </el-table-column>
    </el-table>
    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getEuiList"
    />
  </div>
</template>

<script>
import { terminalList } from "@/api/equ/gateway";

export default {
  name: "Topology",
  dicts: ["data_type", "terminal_runstate"],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 重新渲染表格状态
      refreshTable: true,
      // 网关表格数据
      gatewayList: [],
      getEuiList: [],
      gatewayId: null,
      // 提示标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        gatewayId: null,
        runState: null,
        terminalEui: null,
        appEui: null,
        appId: undefined,
        appName: undefined,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {},
    };
  },
  created() {
    const gatewayId = this.$route.params && this.$route.params.gatewayId;
    this.terminalList(gatewayId);
    // this.getList();
  },
  methods: {
    /** 查询网关列表 */
    terminalList(gatewayId) {
      this.loading = true;
      terminalList(gatewayId).then((response) => {
        console.log(response);
        this.getEuiList = response.rows;
        this.total = response.total;
        if (response.rows.length == 0) {
          this.title = '此网关下无终端连接';
        }else{
          this.title = "网关EUI: " + response.rows[0].gatewayEui + " 下连所有终端信息";
        }
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        gatewayId: null,
        runState: null,
        terminalEui: null,
        appEui: null,
        appId: undefined,
        appName: undefined,
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    // handleQuery() {
    //   this.queryParams.pageNum = 1;
    //   this.getList();
    // },

    /** 返回按钮操作 */
    handleClose() {
      const obj = { path: "/gateway/index" };
      this.$tab.closeOpenPage(obj);
    },
    /** 重置按钮操作 */
    // resetQuery() {
    //   this.resetForm("queryForm");
    //   this.handleQuery();
    // },

    // 多选框选中数据
    handleSelectionChange(selection) {
      this.euis = selection.map((item) => item.terminalEui);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },

    // /** 删除按钮操作 */
    // handleDelete(row) {
    //   const terEui = row.terminalEui || this.euis;
    //   this.$modal
    //     .confirm('是否确认删除终端EUI为"' + terEui + '"的数据项？')
    //     .then(function () {
    //       return delGateway(terEui);
    //     })
    //     .then(() => {
    //       this.getList();
    //       this.$modal.msgSuccess("删除成功");
    //     })
    //     .catch(() => {});
    // },

    /** 导出按钮操作 */
    handleExport() {
      this.download(
        "system/gateway/export",
        {
          ...this.queryParams,
        },
        `gateway_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
<style scoped>
.info {
  margin-bottom: 10px;
}
</style>
