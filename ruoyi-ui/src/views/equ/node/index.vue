<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      size="small"
      :inline="true"
      v-show="showSearch"
      label-width="78px"
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
          placeholder="请选择App名称"
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
          v-hasPermi="['system:node:add']"
          >新增</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:node:edit']"
          >修改</el-button
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
          v-hasPermi="['system:node:remove']"
          >删除</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="info"
          plain
          icon="el-icon-upload2"
          size="mini"
          @click="handleImport"
          v-hasPermi="['system:user:import']"
          >导入</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:node:export']"
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
      :data="nodeList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <!-- <el-table-column label="终端ID" align="center" prop="terminalId" /> -->
      <el-table-column
        label="终端EUI"
        align="center"
        prop="terminalEui"
        sortable
        :default-sort="{ prop: 'terminalEui', order: 'ascending' }"
      />
      <el-table-column label="App名称" align="center" prop="appName" />
      <el-table-column label="网关EUI" align="center" prop="gatewayEui" />
      <!-- <el-table-column label="激活状态" align="center" prop="activeState">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.terminal_activestate"
            :value="scope.row.activeState"
          />
        </template>
      </el-table-column> -->
      <el-table-column label="通信终端运行状态" align="center" prop="runState">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.terminal_runstate"
            :value="scope.row.runState"
          />
        </template>
      </el-table-column>
      <el-table-column
        label="上一次发送消息时间"
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
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:node:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:node:remove']"
            >删除</el-button
          >
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

    <!-- 添加或修改传感器 对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="420px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="终端EUI:" prop="terminalEui">
          <el-input v-model="form.terminalEui" placeholder="请输入终端EUI" />
        </el-form-item>

        <el-form-item label="网关EUI:" prop="gatewayEui">
          <el-input v-model="form.gatewayEui" placeholder="请输入网关EUI" />
        </el-form-item>
        <el-form-item label="App名称:">
          <el-select v-model="form.appEui" placeholder="请输入App名称">
            <el-option
              v-for="dict in dict.type.lora_app_name"
              :key="dict.value"
              :label="dict.label"
              :value="(dict.value)"
            />
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 导入对话框 -->
    <el-dialog
      :title="upload.title"
      :visible.sync="upload.open"
      width="400px"
      append-to-body
    >
      <el-upload
        ref="upload"
        :limit="1"
        accept=".xlsx, .xls"
        :headers="upload.headers"
        :action="upload.url + '?updateSupport=' + upload.updateSupport"
        :disabled="upload.isUploading"
        :on-progress="handleFileUploadProgress"
        :on-success="handleFileSuccess"
        :auto-upload="false"
        drag
      >
        <i class="el-icon-upload"></i>
        <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
        <div class="el-upload__tip text-center" slot="tip">
          <div class="el-upload__tip" slot="tip">
            <el-checkbox v-model="upload.updateSupport" />
            是否更新已经存在的数据
          </div>
          <span>仅允许导入xls、xlsx格式文件。</span>
          <el-link
            type="primary"
            :underline="false"
            style="font-size: 12px; vertical-align: baseline"
            @click="importTemplate"
            >下载模板</el-link
          >
        </div>
      </el-upload>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitFileForm">确 定</el-button>
        <el-button @click="upload.open = false">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  listNode,
  getNode,
  delNode,
  addNode,
  updateNode,
} from "@/api/equ/node";
import { getToken } from "@/utils/auth";

export default {
  name: "Node",
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
      // 传感器 表格数据
      nodeList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        terminalEui: null,
        activeState: null,
        runState: null,
        battery: null,
        lastMsgDt: null,
        gatewayEui: null,
        appEui: null,
      },
      // 表单参数
      form: {},
      // 用户导入参数
      upload: {
        // 是否显示弹出层（用户导入）
        open: false,
        // 弹出层标题（用户导入）
        title: "",
        // 是否禁用上传
        isUploading: false,
        // 是否更新已经存在的用户数据
        updateSupport: 0,
        // 设置上传的请求头部
        headers: { Authorization: "Bearer " + getToken() },
        // 上传的地址
        url: process.env.VUE_APP_BASE_API + "/system/node/importNode",
      },
      // 表单校验
      rules: {
        terminalEui: [
          { required: true, message: "终端EUI不能为空", trigger: "blur" },
        ],
      },
    };
  },
  created() {
    this.getList();
  },
  computed: {
    isCheckedAll() {
      let bl = this.nodeList.every((item) => {
        return item.checked;
      });
      console.log(bl);
      return bl;
    },
  },
  methods: {
    /** 查询传感器 列表 */
    getList() {
      this.loading = true;
      listNode(this.queryParams).then((response) => {
        console.log(response);
        this.nodeList = response.rows;
        this.total = response.total;
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
        terminalId: null,
        terminalEui: null,
        activeState: null,
        runState: null,
        battery: null,
        lastMsgDt: null,
        gatewayEui: null,
        appEui: null,
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
      this.ids = selection.map((item) => item.terminalId);
      this.euis = selection.map((item) => item.terminalEui);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "新增终端";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const terminalId = row.terminalId || this.ids;
      getNode(terminalId).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改终端";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.terminalId != null) {
            updateNode(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addNode(this.form).then((response) => {
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
      const terminalIds = row.terminalId || this.ids;
      const terminalEui = row.terminalEui || this.euis;
       console.log(terminalEui);

      if (terminalIds.length > 1) {
        this.$modal
          .confirm("是否确认删除" + terminalIds.length + "个通信终端数据？")
          .then(function () {
            return delNode(terminalIds);
          })
          .then(() => {
            this.getList();
            this.$modal.msgSuccess("删除成功");
          })
          .catch(() => {});
      } else {
        this.$modal
          .confirm("是否确认删除通信终端EUI为" + terminalEui + "的终端？")
          .then(function () {
            return delNode(terminalIds);
          })
          .then(() => {
            this.getList();
            this.$modal.msgSuccess("删除成功");
          })
          .catch(() => {});
      }

    },
    /** 导入按钮操作 */
    handleImport() {
      this.upload.title = " 导入";
      this.upload.open = true;
    },
    /** 下载模板操作 */
    importTemplate() {
      this.download(
        "/system/node/importTemplate",
        {},
        `node_template_${new Date().getTime()}.xlsx`
      );
    },
    // 文件上传中处理
    handleFileUploadProgress(event, file, fileList) {
      this.upload.isUploading = true;
    },
    // 文件上传成功处理
    handleFileSuccess(response, file, fileList) {
      this.upload.open = false;
      this.upload.isUploading = false;
      this.$refs.upload.clearFiles();
      this.$alert(
        "<div style='overflow: auto;overflow-x: hidden;max-height: 70vh;padding: 10px 20px 0;'>" +
          response.msg +
          "</div>",
        "导入结果",
        { dangerouslyUseHTMLString: true }
      );
      this.getList();
    },
    // 提交上传文件
    submitFileForm() {
      this.$refs.upload.submit();
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download(
        "system/node/export",
        {
          ...this.queryParams,
        },
        `node_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
