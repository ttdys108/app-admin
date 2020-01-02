<template>
  <el-dialog
    :title="title"
    :visible.sync="visible"
  >
    <el-form :model="form" ref="form" label-width="100px"
      >
      <el-row>
        <el-col :span="12">
          <el-form-item
            prop="parentName"
            :label="dict.label_parent_menu"
          >
            <el-input :disabled="true" v-model="form.parentName"></el-input>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item
            prop="code"
            :label="dict.label_key"
            :rules="keyRules"
          >
            <el-input v-model="form.code"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item
            prop="path"
            :label="dict.label_path"
            :rules="requiredRule"
          >
            <el-input v-model="form.path"></el-input>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item
            prop="auth"
            :label="dict.label_auth"
          >
            <el-input v-model="form.auth"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item
            prop="status"
            :label="dict.label_status"
            :rules="requiredRuleChange"
          >
            <el-select v-model="form.status">
              <el-option v-for="status in menusStatus" :key="status" :label="dict[status]" :value="status"/>
            </el-select>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item
            prop="icon"
            :label="dict.label_icon"
          >
            <el-select v-model="form.icon">
              <el-option v-for="ic in elIcons" :key="ic" :value="ic">
                <i :class="ic"></i>
              </el-option>
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item
            prop="priority"
            :label="dict.label_priority"
            :rules="requiredRule"
          >
            <el-input type="number" v-model="form.priority"></el-input>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="24">
          <el-form-item
            prop="desc"
            :label="dict.label_desc"
            :rules="requiredRule"
          >
            <el-input v-model="form.desc"></el-input>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="24">
          <el-form-item>
            <el-button :loading="loading" type="primary" @click="submit">{{ dict.action_submit }}</el-button>
          </el-form-item>
        </el-col>
      </el-row>




    </el-form>
  </el-dialog>
</template>

<script>
import { add, queryStatus, update } from '@/api/menu'
import elIcons from './el-icons'
import mixins from '@/mixins'

export default {
  mixins: [
    mixins,
  ],
  data() {
    return {
      form: this.initForm(),
      visible: false,
      actionType: 'add',
      menusStatus: [],
      elIcons: elIcons,
    }
  },
  computed: {
    title() {
      return this.actionType === 'add' ? this.dict.action_add_menu : this.dict[this.form.code];
    },
    keyRules() {
      return [ this.requiredRule, this.commonCharRule ]
    },
  },
  methods: {
    initForm() {
      return {
        id: undefined,
        parent: undefined,
        parentName: '',
        code: '',
        path: '',
        auth: '',
        status: 'ON',
        priority: 0,
        icon: '',
        desc: '',
      };
    },
    show(actionType, data) {
      this.visible = true;
      if(actionType === 'add') { //新增
        if(this.actionType !== actionType || data.id !== this.form.parent) {
          this.form = this.initForm();
        }
        if(data.id) {
          this.form.parent = data.id;
          this.form.parentName = this.dict[data.code];
        } else {
          this.form.parentName = this.dict.menu_root;
        }
      } else {//修改
        if(actionType === 'edit' && this.form.id === data.id)
          return; //复用原来的页面数据
        this.form = data;
      }
      this.actionType = actionType;
    },
    // onOpen() {
    //   if(this.actionType === 'add')
    //     this.form = this.initForm();
    // },
    submit() {
      this.$refs.form.validate(valid => {
        if(!valid)
          return;
        this.loading = true;
        let action = this.actionType === 'add' ? add : update;
        action(this.form).then(resp => {
          if(resp.code === '000000') {
            this.visible = false;
            this.$emit('updated');
            this.form = this.initForm(); //重置
          } else {
            this.$notify.error(resp.msg)
          }

          this.loading = false;
        }).catch(err => {
          this.LOG('add dict error', err);
          this.loading = false;
        })

      })

    },

  },
  created() {
    queryStatus().then(resp => {
      if(this.IS_SUCCEED(resp)) {
        this.menusStatus = resp.data;
      } else {
        this.$notify.error(resp.msg);
      }
    }).catch(err => {
      this.LOG('query menu status error', err);
    })

  },

}

</script>

<style scoped>
i{
  font-size: 1.5rem;
}


</style>
