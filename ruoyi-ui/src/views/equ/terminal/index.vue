<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      size="small"
      :inline="true"
      v-show="showSearch"
      label-width="75px"
    >
      <el-form-item label="终端EUI:" prop="terminalEui">
        <el-input
          v-model="queryParams.terminalEui"
          placeholder="请输入终端EUI"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="App名称:" prop="appEui">
        <el-select
          v-model="queryParams.appEui"
          placeholder="请输入App名称"
          clearable
        >
          <el-option
            v-for="dict in dict.type.lora_app_name"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>

      </el-form-item>
      <el-form-item label="传感器名称:" prop="sensorType" label-width="90px">
        <el-select
          v-model="queryParams.sensorType"
          placeholder="请选择传感器名称"
          clearable
        >
          <el-option
            v-for="dict in dict.type.data_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="运行状态:" prop="runState">
        <el-select
          v-model="queryParams.runState"
          placeholder="请选择运行状态"
          clearable
        >
          <el-option
            v-for="dict in dict.type.terminal_runstate"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <!-- <el-form-item label="激活状态:" prop="activeState">
        <el-select
          v-model="queryParams.activeState"
          placeholder="请选择激活状态"
          clearable
        >
          <el-option
            v-for="dict in dict.type.terminal_activestate"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item> -->
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
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['equ:terminal:add']"
          >新增</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['equ:terminal:remove']"
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
          v-hasPermi="['equ:terminal:export']"
          >导出</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-bell"
          size="mini"
          @click="handleCalibrate"
          :disabled="multiple"
          >校准</el-button
        >
      </el-col>
      <right-toolbar
        :showSearch.sync="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="terminalList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="设备编号" align="center" prop="sn" id="sn" sortable :default-sort="{prop: 'sn', order: 'ascending'}"/>
      <el-table-column label="终端EUI" align="center" prop="terminalEui" sortable :default-sort="{prop: 'terminalEui', order: 'ascending'}"/>
      <el-table-column label="传感器ID" align="center" prop="sensorId" />
      <el-table-column label="App名称" align="center" prop="appName" />
      <el-table-column label="传感器名称" align="center" prop="sensorType" sortable :default-sort="{prop: 'sensorType', order: 'ascending'}">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.data_type"
            :value="scope.row.sensorType"
          />
        </template>
      </el-table-column>
      <el-table-column label="业务终端运行状态" align="center" prop="runState">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.terminal_runstate"
            :value="scope.row.runState"
          />
        </template>
      </el-table-column>
      <!-- <el-table-column label="激活状态" align="center" prop="activeState">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.terminal_activestate"
            :value="scope.row.activeState"
          />
        </template>
      </el-table-column> -->

      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['equ:terminal:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['equ:terminal:remove']"
            >删除</el-button
          >
          <!-- 详情按钮 -->
          <el-button
            size="mini"
            type="text"
            icon="el-icon-tickets"
            @click="handleShowDetail(scope.row)"
            v-hasPermi="['system:return:query']"
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

    <!-- 添加或修改应用对话框 -->
    <el-dialog
      :title="title"
      :visible.sync="openOne"
      width="420px"
      append-to-body
    >
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <!-- <el-row>
          <el-col :span="12"> -->
        <el-form-item label="终端EUI:" prop="terminalEui">
          <el-input v-model="form.terminalEui" placeholder="请输入终端EUI" :disabled="disabled"/>
        </el-form-item>
        <!-- </el-col>
          <el-col :span="12"> -->
        <el-form-item label="传感器ID:" prop="sensorId">
          <el-input v-model="form.sensorId" placeholder="请输入传感器ID" :disabled="disabled"/>
        </el-form-item>
        <!-- </el-col>
        </el-row>
        <el-row>
          <el-col :span="12"> -->
        <el-form-item label="App名称:">
          <el-select v-model="form.appEui" placeholder="请输入App名称">
          <el-option
            v-for="dict in dict.type.lora_app_name"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
          </el-select>
        </el-form-item>
        <!-- </el-col>
          <el-col :span="12"> -->
        <el-form-item label="传感器名称:">
          <el-select v-model="form.sensorType" placeholder="请选择传感器名称">
            <el-option
              v-for="dict in dict.type.data_type"
              :key="dict.value"
              :label="dict.label"
              :value="Number(dict.value)"
            />
          </el-select>
        </el-form-item>
        <!-- </el-col>
        </el-row> -->

        <!-- 修改业务 -->
        <!-- <span class="change_oper">修改业务</span>
        <el-row>
          <el-col :span="12">
            <span class="operation">TDMA</span>
            <el-form-item label="周期:" prop="tdmaCycle">
              <el-input v-model="form.tdmaCycle" placeholder="请输入周期" />
            </el-form-item>
          </el-col>
          <span class="operation"></span>
          <el-col :span="12">
            <el-form-item label="时隙宽度:" prop="tdmaWidth">
              <el-input v-model="form.tdmaWidth" placeholder="请输入时隙宽度" />
            </el-form-item>
          </el-col>
        </el-row>
        <hr />
        <el-row>
          <el-col :span="12">
            <span class="operation">随机</span>
            <el-form-item label="周期:" prop="cycle">
              <el-input v-model="form.cycle" placeholder="请输入周期" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <span class="operation"></span>
            <el-form-item label="阈值-最大值:" prop="thresholdMax">
              <el-input
                v-model="form.thresholdMax"
                placeholder="请输入最大值"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="阈值-当前值:" prop="thresholdNow">
              <el-input
                v-model="form.thresholdNow"
                placeholder="请输入当前值"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="阈值-最小值:" prop="thresholdMin">
              <el-input
                v-model="form.thresholdMin"
                placeholder="请输入最小值"
              />
            </el-form-item>
          </el-col>
        </el-row> -->
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 详情对话框 -->
    <el-dialog
      :title="title"
      :visible.sync="openTwo"
      width="620px"
      append-to-body
    >
      <el-descriptions title="TDMA" direction="vertical" :column="4" border>
        <el-descriptions-item label="周期">{{
          this.getReturnList.tdmaCycle
        }}</el-descriptions-item>
        <el-descriptions-item label="时隙宽度">{{
          this.getReturnList.tdmaWidth
        }}</el-descriptions-item>
      </el-descriptions>
      <el-descriptions
        title="随机"
        direction="vertical"
        :column="4"
        border
        class="random"
      >
        <el-descriptions-item label="周期">{{
          this.getReturnList.cycle
        }}</el-descriptions-item>
        <el-descriptions-item label="阈值-最大值">{{
          this.getReturnList.thresholdMax
        }}</el-descriptions-item>
        <el-descriptions-item label="阈值-当前值">{{
          this.getReturnList.thresholdNow
        }}</el-descriptions-item>
        <el-descriptions-item label="阈值-最小值">{{
          this.getReturnList.thresholdMin
        }}</el-descriptions-item>
      </el-descriptions>
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancel">确 定</el-button>
      </div>
    </el-dialog>

    <!-- 校准对话框 -->
    <el-dialog
      :title="title"
      :visible.sync="openThree"
      width="420px"
      append-to-body
    >
      <el-form label-width="100px">
        <el-form-item label="时间:">
          <el-select v-model="time" placeholder="请选择校准时间">
            <el-option label="1小时" value="1"></el-option>
            <el-option label="2小时" value="2"></el-option>
            <el-option label="3小时" value="3"></el-option>
            <el-option label="4小时" value="4"></el-option>
            <el-option label="5小时" value="5"></el-option>
            <el-option label="6小时" value="6"></el-option>
            <el-option label="7小时" value="7"></el-option>
            <el-option label="8小时" value="8"></el-option>
            <el-option label="9小时" value="9"></el-option>
            <el-option label="10小时" value="10"></el-option>
            <el-option label="11小时" value="11"></el-option>
            <el-option label="12小时" value="12"></el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitCalibrateForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  listTerminal,
  getTerminal,
  delTerminal,
  addTerminal,
  updateTerminal,
  calibrateTerminal,
  getReturn,
  getReturnList,
  updateReturn,
} from "@/api/equ/terminal";

export default {
  name: "Terminal",
  dicts: ["terminal_activestate", "terminal_runstate", "data_type","lora_app_name"],
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
      // 终端 表格数据
      terminalList: [],
      getReturnList: {},
      // 弹出层标题
      title: "",
      //校准时间
      time: "",
      //禁用
      disabled: false,
      // 是否显示弹出层
      openOne: false,
      openTwo: false,
      openThree: false,
      // 应用名称
      appName: undefined,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        SN: null,
        sensorType: undefined,
        terminalEui: null,
        sensorId: null,
        appEui: null,
        runState: null,
        activeState: null,
        lastMsgDt: null,
        appId: undefined,
        appName: undefined,
        thresholdMax: null,
        thresholdMin: null,
        thresholdNow: null,
        cycle: null,
        tdmaWidth: null,
        tdmaCycle: null,
        //
        isAsc: undefined,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        terminalEui: [
          { required: true, message: "终端EUI不能为空", trigger: "blur" },
        ],
        sensorId: [
          { required: true, message: "传感器ID不能为空", trigger: "blur" },
        ],
      },
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询终端 列表 */
    getList() {
      this.loading = true;
      listTerminal(this.queryParams).then((response) => {
        this.terminalList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.openOne = false;
      this.openTwo = false;
      this.openThree = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        snId: null,
        sensorId: null,
        sensorType: undefined,
        terminalEui: null,
        appEui: null,
        runState: null,
        activeState: null,
        lastMsgDt: null,
        appId: null,
        appName: null,
        cycle: null,
        thresholdNow: null,
        thresholdMax: null,
        thresholdMin: null,
        tdmaWidth: null,
        tdmaCycle: null,
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
      this.ids = selection.map((item) => item.snId);
      this.sns = selection.map((item) => item.sn);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      // this.disabled= false;
      this.openOne = true;
      this.title = "新增终端 ";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      this.disabled= true;
      const snId = row.snId || this.ids;
      getTerminal(snId).then((response) => {
        // this.disabled= false;
        this.form = response.data;
        this.openOne = true;
        this.title = "修改终端 ";
      });
    },
    /** 详情按钮操作 */
    handleShowDetail(row) {
      this.reset();
      const snId = row.snId || this.ids;
      getTerminal(snId).then((response) => {
        this.getReturnList = response.data;
        this.openTwo = true;
        this.title = "业务详情";
      });
    },
    /** 校准按钮操作 */
    handleCalibrate() {
      this.reset();
      this.openThree = true;
      this.title = "校准";
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.snId != null) {
            updateTerminal(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.openOne = false;
              this.openTwo = false;
              this.getList();
            });
          } else {
            addTerminal(this.form).then((response) => {
              this.$modal.msgSuccess("新增成功");
              this.openOne = false;
              this.openTwo = false;
              this.getList();
            });
          }
        }
      });
    },
    submitCalibrateForm() {
      var calibrateList = {
        sns: this.sns,
        time: parseInt(this.time),
      };
      calibrateTerminal(calibrateList).then((response) => {
      this.openThree = false;
      this.time = "";
      this.getList();
      })
      // this.openThree = false;
      // this.time = "";
      // this.getList();                                                                                                          .
      // console.log(calibrateList);

    },

    /** 删除按钮操作 */
    handleDelete(row) {
      const snIds = row.snId || this.ids;
      const sn = row.sn || this.sns;
      if (snIds.length > 1) {
        this.$modal
          .confirm('是否确认删除' + sn.length + '个业务终端数据？')
          .then(function () {
            return delTerminal(snIds);
          })
          .then(() => {
            this.getList();
            this.$modal.msgSuccess("删除成功");
          })
          .catch(() => {});
      } else {
        this.$modal
          .confirm('是否确认删除设备编号为' + sn + '的终端？')
          .then(function () {
            return delTerminal(snIds);
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
        "equ/terminal/export",
        {
          ...this.queryParams,
        },
        `terminal_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>

<style lang="css" scoped>
.text {
  display: inline-block;
  font-size: 24px;
  font-weight: bold;
  margin: 15px auto 25px 15px;
}
.operation {
  font-size: 15px;
  margin: 15px auto 5px 15px;
}
.change_oper {
  display: inline-block;
  font-size: 18px;
  color: black;
  margin: 0 auto 25px 0;
}
.random {
  margin-top: 20px;
}
</style>
