<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      size="small"
      :inline="true"
      v-show="showSearch"
      label-width="80px"
    >
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
      <el-form-item label="负责人:" prop="managerName">
        <el-input
          v-model="queryParams.managerName"
          placeholder="请输入负责人名字"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button
          type="primary"
          icon="el-icon-search"
          size="mini"
          @click="handleQuery(true)"
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
          v-hasPermi="['app:appManagement:add']"
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
          v-hasPermi="['app:appManagement:remove']"
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
          v-hasPermi="['app:appManagement:export']"
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
      :data="appManagementList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="AppEUI" align="center" prop="appEui" />
      <el-table-column label="App名称" align="center" prop="appName" />
      <el-table-column
        label="创建时间"
        align="center"
        prop="createTime"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="授权状态" align="center" prop="authState">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.app_authstate"
            :value="scope.row.authState"
          />
        </template>
      </el-table-column>
      <el-table-column
        label="授权结束日期"
        align="center"
        prop="timeto"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.timeto, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column>
      <el-table-column label="所属单位" align="center" prop="company" />
      <el-table-column label="负责人名字" align="center" prop="managerName" />
      <el-table-column label="联系电话" align="center" prop="phone" />
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
            v-hasPermi="['app:appManagement:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['app:appManagement:remove']"
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

    <!-- 添加或修改应用对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="780px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-row>
          <el-col :span="12">
            <el-form-item prop="appEui">
              <span slot="label">
                <el-tooltip
                  content="AppEUI格式为1011000X，其中X为0~9任意数字。"
                  placement="top"
                >
                  <i class="el-icon-question"></i>
                </el-tooltip>
                AppEUI:
              </span>
              <el-input v-model="form.appEui" placeholder="请输入AppEUI" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="App名称:" prop="appName">
              <el-input v-model="form.appName" placeholder="请输入App名称" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="所属单位:" prop="company">
              <el-input v-model="form.company" placeholder="请输入所属单位" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="负责人:" prop="managerName">
              <el-input
                v-model="form.managerName"
                placeholder="请输入负责人姓名"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="联系电话:" prop="phone">
              <el-input
                v-model="form.phone"
                placeholder="请输入联系电话"
                maxlength="11"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12"> </el-col>
          <el-col :span="12">
            <el-form-item label="授权开始日期:" prop="authStarttime">
              <el-date-picker
                clearable
                v-model="form.authStarttime"
                type="date"
                value-format="yyyy-MM-dd"
                placeholder="请选择授权开始日期"
                @change="changeData(true)"
                :picker-options="pickerOptions"
              >
              </el-date-picker>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="授权结束日期:" prop="timeto">
              <el-date-picker
                clearable
                v-model="form.timeto"
                type="date"
                value-format="yyyy-MM-dd"
                placeholder="请选择授权结束日期"
                @change="changeData(true)"
              >
              </el-date-picker>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  listAppManagement,
  getAppManagement,
  delAppManagement,
  addAppManagement,
  updateAppManagement,
  changeAppStatus,
} from "@/api/app/appManagement";

export default {
  name: "AppManagement",
  dicts: ["app_authstate","lora_app_name"],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      //输入框输入值
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 应用表格数据
      appManagementList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        appEui: null,
        appSecret: null,
        appName: null,
        createTime: null,
        terminals: null,
        managerName: null,
        authStarttime: null,
        timeto: null,
        authState: undefined,
        company: null,
        phone: null,
      },
      // 列信息
      columns: [
        { key: 0, label: `AppEUI`, visible: true },
        { key: 1, label: `App名称`, visible: true },
        { key: 2, label: `创建时间`, visible: true },
        { key: 3, label: `授权状态`, visible: true },
        { key: 4, label: `授权结束日期`, visible: true },
        { key: 5, label: `所属公司`, visible: true },
        { key: 6, label: `负责人名字`, visible: true },
        { key: 7, label: `联系电话`, visible: true },
      ],
      // 表单参数
      form: {},
      //时间禁用
      pickerOptions: {
	        disabledDate(time) {
	          return time.getTime() < Date.now();
	        }
      },
      // 表单校验
      rules: {
        appName: [
          { required: true, message: "App名称不能为空", trigger: "blur" },
          { min: 2, max: 20, message: 'App名称长度必须介于 2 和 20 之间', trigger: 'blur' }
        ],
        appEui: [
          { required: true, message: "AppEUI不能为空", trigger: "blur" },
          { min: 8, max: 8, message: 'AppEUI长度必须为8位数 ', trigger: 'blur' }
        ],
        phone: [
          {
            pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/,
            message: "请输入正确的手机号码",
            trigger: "blur",
          },
        ],
      },
    };
  },
  created() {
    this.getList();
  },

  methods: {
    /** 查询应用列表 */
    getList() {
      this.loading = true;
      listAppManagement(this.queryParams).then((response) => {
        console.log(response);
        this.appManagementList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    //时间校验
    changeData(flag) {
	      if (flag) {
	        if (this.form.timeto) {
	          if (this.form.authStarttime > this.form.timeto) {
	            this.form.authStarttime = null;
	            this.$message.error("开始时间不能大于结束时间！");
	          }
	        }
	      } else {
	        if (this.form.authStarttime) {
	          if (this.form.authStarttime > this.form.timetoe) {
	            this.form.timeto = null;
	            this.$message.error("结束时间不能小于开始时间！");
	          }
	        }
	      }
	    },

    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        appId: null,
        appEui: null,
        appSecret: null,
        appName: null,
        createTime: null,
        descript: null,
        terminals: null,
        managerName: null,
        timeto: null,
        authState: null,
        authStarttime: null,
        company: null,
        phone: null,
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
      this.ids = selection.map((item) => item.appId);
      this.names = selection.map((item) => item.appName);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "新增应用";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const appId = row.appId || this.ids;
      getAppManagement(appId).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改应用";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.appId != null) {
            updateAppManagement(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addAppManagement(this.form).then((response) => {
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
      const appIds = row.appId || this.ids;
      const appNames = row.appName || this.names;
      this.$modal
        .confirm('是否确认删除App名称为"' + appNames + '"的数据项？')
        .then(function () {
          return delAppManagement(appIds);
        })
        .then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        })
        .catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download(
        "app/appManagement/export",
        {
          ...this.queryParams,
        },
        `appManagement_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>

<style>
.el-input--medium {
  width: 220px;
}

.dialog-footer {
  text-align: center;
}
</style>
