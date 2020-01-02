<template>
  <div class="box-shadow bg-white p-10" style="width:80%; margin: 10px auto;">
    <h4 class="title">用户管理</h4>
    <div class="m-10">
      <el-row :gutter="10">
        <el-col :span="3">
          <el-input size="medium" :placeholder="dict.tips_search_username" v-model="query.username" />
        </el-col>
        <el-col :span="3">
          <el-input size="medium" :placeholder="dict.tips_search_mobile" v-model="query.mobile" />
        </el-col>
        <el-col :span="3">
          <el-input size="medium" :placeholder="dict.tips_search_email" v-model="query.email" />
        </el-col>
        <el-col :span="2">
          <el-button icon="el-icon-search" @click="doQuery(1)" size="medium" type="primary">{{ dict.label_search }}</el-button>
        </el-col>
        <el-col :span="2">
          <el-button icon="el-icon-refresh" @click="resetQuery" size="medium" type="warning">{{ dict.label_reset }}</el-button>
        </el-col>
      </el-row>
    </div>
    <div>
      <el-table
        :data="users"
      >
        <el-table-column prop="username" :label="dict.label_username" />
        <el-table-column prop="nickname" :label="dict.label_nickname" />
        <el-table-column prop="mobile" :label="dict.label_mobile" />
        <el-table-column prop="email" :label="dict.label_email" />
        <el-table-column :label="dict.label_status">
          <template slot-scope="scope">
            <span :class="{ danger: scope.row.status!=='ACTIVE'}">{{ dict[scope.row.status] }}</span>
            <el-button @click="toSetUserStatus(scope.row)" size="small" type="text">{{ dict.settings }}</el-button>
          </template>
        </el-table-column>
        <el-table-column :label="dict.label_action">
          <template slot-scope="scope">
            <el-button @click="toSetAuthr(scope.row)" size="small" type="text">{{ dict.action_auth }}</el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-pagination @current-change="doQuery" class="mt-10" :page-size="pageSize" :total="totalCount" :current-page="pageNo"/>
    </div>

    <!-- 用户状态设置 -->
    <div>
      <el-dialog
        :visible.sync="statusDialog"
        :title="dict.action_change_user_status"
      >
        <el-form
          label-width="100px"
        >
          <el-form-item :label="dict.user">
            <el-input style="width: 200px;" v-model="currentUser" :disabled="true" />
          </el-form-item>
          <el-form-item :label="dict.label_status">
            <el-select style="width: 200px;" v-model="currentStatus">
              <el-option v-for="st in userStatus" :key="st" :value="st" :label="dict[st]"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item>
            <el-button :loading="loading" :disabled="currentStatus===preStatus" @click="updateUserStatus" type="primary">{{ dict.confirm }}</el-button>
          </el-form-item>
        </el-form>
      </el-dialog>
    </div>
    <!-- 权限设置 -->
    <div>
      <el-dialog
        :visible.sync="authDialog"
        :title="dict.action_auth+': ' + currentUser"
      >
        <div  class="sel-auth-all">
          <el-checkbox @change="selAuthAll">{{dict.label_select_all}}</el-checkbox>
        </div>

        <el-tree
          :data="menus"
          :props="treeProps"
          node-key="id"
          default-expand-all
          :expand-on-click-node="false"
          ref="tree"
        >
          <span class="custom-tree-node" slot-scope="{ node, data }">
            <span>
              <el-checkbox @change="(val) => selAuthRow(val, data.path)">{{ node.label }}</el-checkbox>
            </span>
            <span>
              <el-checkbox v-model="currentAuthrs[data.path].readable">{{dict.authr_readable}}</el-checkbox>
              <el-checkbox v-model="currentAuthrs[data.path].creatable">{{dict.action_add}}</el-checkbox>
              <el-checkbox v-model="currentAuthrs[data.path].updatable">{{dict.action_edit}}</el-checkbox>
              <el-checkbox v-model="currentAuthrs[data.path].deletable">{{dict.action_delete}}</el-checkbox>
            </span>
          </span>
        </el-tree>
        <el-button :loading="loading" @click="setAuthr" class="auth-btn" size="medium" type="primary" >{{dict.action_submit}}</el-button>
      </el-dialog>
    </div>
  </div>

</template>

<script>
import { query as queryUser, update } from '@/api/user'
import { mapState } from 'vuex'
import { queryAuthr, grant } from '@/api/authr'
import mixins from '@/mixins'

export default {
  mixins: [
    mixins,
  ],
  data() {
    return {
      users: [],
      query: this.initQuery(),
      statusDialog: false,
      authDialog: false,
      currentStatus: '',
      authrMenus: [],
      currentAuthrs: {},
      treeProps: {
        label: 'name',
      },
      preStatus: '',
      userId: '',
      currentUser: '',
      userStatus: [
        'ACTIVE', 'FROZEN'
      ]
    }

  },
  computed: {
    ...mapState({
      menus: state => state.menus.menus
    })
  },
  created() {
    this.doQuery(1);
    this.initAuthr(false);
  },
  methods: {
    initQuery() {
      return {
        username: '',
        mobile: '',
        email: '',
      }
    },
    resetQuery() {
      this.query = this.initQuery();
      this.doQuery(1);
    },
    doQuery(pageNo) {
      this.pageNo = pageNo;
      let params = {
        pageNo: pageNo,
        pageSize: this.pageSize,
        ...this.query,
      }
      // this.LOG('query params:', params);
      queryUser(params).then(resp => {
        if(this.IS_SUCCEED(resp)) {
          this.users = resp.data.results;
          this.totalCount = resp.data.totalCount;
        } else {
          this.$notify.error(resp.msg);
        }
      }).catch(err => {
        this.ERROR('query user err', err);
      })
    },
    toSetUserStatus(data) {
      this.LOG('to set', data);
      this.statusDialog = true;
      this.currentUser = data.username;
      this.currentStatus = data.status;
      this.preStatus = data.status;
      this.userId = data.id;
    },
    updateUserStatus(data) {
      this.loading = true;
      let params = {
        id: this.userId,
        status: this.currentStatus,
      }
      update(params).then(resp => {
        if(!this.IS_SUCCEED(resp))
          this.$notify.error(resp.msg);
        this.afterUpdateStatus();
      }).catch(err => {
        this.ERROR('update user status err', err);
        this.afterUpdateStatus();
      })
    },
    afterUpdateStatus() {
      this.loading = false;
      this.statusDialog = false;
      this.doQuery(1);
    },
    toSetAuthr(data) {
      this.currentUser = data.username;
      this.userId = data.id;
      this.authDialog = true;
      this.initAuthr(false);
      // console.log('authr menu', this.currentAuthrs);
      queryAuthr(data.id).then(resp => {
        if(this.IS_SUCCEED(resp)) {
          this.handleMenuAuthr(this.menus, resp.data);
        } else {
          this.$notify.error(resp.msg);
        }
      }).catch(err => {
        this.ERROR('query authr err', err);
      })

    },
    handleMenuAuthr(menus, authrs) {
      menus.forEach(menu => {
        for(let i in authrs) {
          if(authrs[i].resource === menu.path) {
            this.LOG('sssssssss', this.currentAuthrs, !!(authrs[i].grants & 1));
            this.currentAuthrs = {
              ...this.currentAuthrs,
              [menu.path]: {
                readable: !!(authrs[i].grants & 1),
                creatable: !!(authrs[i].grants & 2),
                updatable: !!(authrs[i].grants & 4),
                deletable: !!(authrs[i].grants & 8),
              }
            }
            authrs.splice(i, 1);
            this.LOG(menu);
          }
        }
        if(menu.children)
          this.handleMenuAuthr(menu.children, authrs);
      })
      this.LOG('crr auth', this.currentAuthrs)
    },
    test() {
      console.log(this.currentAuthrs);
    },
    initAuthr(bol) {
      let func = (menus) => {
        menus.forEach(menu => {
          menu.name = this.dict[menu.code];
          //手动绑定响应
          this.currentAuthrs = {
            ...this.currentAuthrs,
            [menu.path]: {
              readable: bol,
              creatable: bol,
              updatable: bol,
              deletable: bol,
            }
          }
          if(menu.children)
            func(menu.children);
        })
      }
      func(this.menus);
    },
    setAuthr() {
      let params = {
        userId: this.userId,
        authrInfos: this.currentAuthrs,
      }
      this.loading = true;
      grant(params).then(resp => {
        if(!this.IS_SUCCEED(resp)) {
          this.$notify.error(resp.msg);
        } else {
          this.NOTIFY_SUCCEED();
        }

        this.afterGrant();
      }).catch(err => {
        this.ERROR('grant authr err', err);
        this.afterGrant();
      })
    },
    afterGrant() {
      this.loading = false;
      this.authDialog = false;
    },
    selAuthRow(val, path) {
      // this.LOG('sel', val, path);
      this.currentAuthrs = {
        ...this.currentAuthrs,
        [path]: {
          readable: val,
          creatable: val,
          updatable: val,
          deletable: val,
        }
      }
    },
    selAuthAll(val) {
      this.initAuthr(val)
    }
  }

}

</script>

<style scoped>
.title{
  margin-left: 20px;
}
.danger{
  color: #d63200;
}
.custom-tree-node span{
  margin-right: 60px;
}
.auth-btn{
  margin: 30px 0 10px 10px;
}
.sel-auth-all{
  margin: 0 0 10px 24px;
}
</style>
