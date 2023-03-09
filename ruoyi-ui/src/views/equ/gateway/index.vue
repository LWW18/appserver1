<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      size="small"
      :inline="true"
      v-show="showSearch"
      label-width="85px"
    >
      <el-form-item label="网关EUI:" prop="gwEui">
        <el-input
          v-model="queryParams.gwEui"
          placeholder="请输入网关EUI"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="网关名称:" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入网关名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="网关状态:" prop="runState">
        <el-select
          v-model="queryParams.runState"
          placeholder="请选择网关状态"
          clearable
        >
          <el-option
            v-for="dict in dict.type.gateway_runstate"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button
          type="primary"
          icon="el-icon-search"
          size="mini"
          @click="handleQuery"
          >搜索</el-button
        >
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery"
          >重置</el-button
        >
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:gateway:remove']"
          >删除</el-button
        >
      </el-col>
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
      <right-toolbar
        :showSearch.sync="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="gatewayList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="网关EUI" align="center" prop="gwEui">
        <template slot-scope="scope">
          <router-link
            :to="'/gateway/topology/'+ scope.row.gatewayId"
            class="link-type"
          >
            <span>{{ scope.row.gwEui }}</span>
          </router-link>
        </template>
      </el-table-column>
      <el-table-column label="网关名称" align="center" prop="name" />
      <el-table-column label="网关位置(GPS)" align="center" prop="gps" width="180" />
      <el-table-column label="网关状态" align="center" prop="runState">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.gateway_runstate"
            :value="scope.row.runState"
          />
        </template>
      </el-table-column>
      <el-table-column label="LoRa通道数" align="center" prop="loraCount" />
      <el-table-column
        label="上次发送消息时间"
        align="center"
        prop="lastMsgDt"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.lastMsgDt) }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:gateway:remove']"
            >删除</el-button
          >
          <!-- 详情按钮 -->
          <el-button
            size="mini"
            type="text"
            icon="el-icon-tickets"
            @click="handleShowDetail(scope.row)"
            v-hasPermi="['system:gateway:detail']"
          >
            详情
          </el-button>
        </template>
      </el-table-column>
    </el-table>
    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />
    <!-- 详情对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
      <el-table v-loading="loading" :data="getEuiList">
        <el-table-column label="接口编号" align="center" prop="loraId" />
        <el-table-column label="发射功率(dBm)" align="center" prop="transmitPower" />
        <el-table-column label="波特率" align="center" prop="loraBand" />
        <el-table-column label="扩频因子" align="center" prop="spreadingFactor" />
        <el-table-column label="发射功率带宽(kHz)" align="center" prop="bandwidth" width="180px"/>
        <el-table-column label="信道频率" align="center" prop="frequency " />
        <!-- <el-table-column label="状态" align="center" prop="sensorType" /> -->
      </el-table>
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancel">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  listGateway,
  getGateway,
  delGateway,
  addGateway,
  updateGateway,
  terminalList,
  listInterface,
  getInterface
} from "@/api/equ/gateway";


export default {
  name: "Gateway",
  dicts: ["gateway_runstate", "data_type"],
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
      // 是否展开，默认全部折叠
      isExpandAll: false,
      // 重新渲染表格状态
      refreshTable: true,
      // 网关表格数据
      gatewayList: [],
      getEuiList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        gwEui: null,
        gatewayId: null,
        name: null,
        fwVersion: null,
        runState: null,
        createDt: null,
        regDt: null,
        lastConnDt: null,
        lastMsgDt: null,
        battery: null,
        powerType: null,
        gps: null,
        loraCount: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {},
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询网关列表 */
    getList() {
      this.loading = true;
      listGateway(this.queryParams).then((response) => {
        this.gatewayList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 确定按钮
    submit(){
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        gatewayId: null,
        gwEui: null,
        name: null,
        fwVersion: null,
        runState: null,
        createDt: null,
        regDt: null,
        lastConnDt: null,
        lastMsgDt: null,
        battery: null,
        powerType: null,
        gps: null,
        loraCount: null,
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map((item) => item.gatewayId);
      this.euis = selection.map((item) => item.gwEui);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },

    /** 详情按钮操作 */
    handleShowDetail(row) {
      this.loading = true;
      const eui = row.gwEui;
      getInterface(eui).then((response) => {
        this.getEuiList = response.rows;
        this.loading = false;
      });
      this.open = true;
      this.title = "网关接口详情";
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.gatewayId != null) {
            updateGateway(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addGateway(this.form).then((response) => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const gatewayIds = row.gatewayId || this.ids;
      const gatewayEuis = row.gwEui || this.euis;
      if (gatewayIds.length > 1) {
        this.$modal
          .confirm("是否确认删除" + gatewayEuis.length + "个网关数据？")
          .then(function () {
            return delGateway(gatewayIds);
          })
          .then(() => {
            this.getList();
            this.$modal.msgSuccess("删除成功");
          })
          .catch(() => {});
      } else {
        this.$modal
          .confirm("是否确认删除网关EUI为" + gatewayEuis + "的网关？")
          .then(function () {
            return delGateway(gatewayIds);
          })
          .then(() => {
            this.getList();
            this.$modal.msgSuccess("删除成功");
          })
          .catch(() => {});
      }

    },
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
