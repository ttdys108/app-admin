<template>
  <el-dialog
    :title="title"
    :visible.sync="visible"
  >
    <el-form :model="form" ref="form" label-width="100px">
      <el-form-item
        prop="dictKey"
        :label="dict.label_key"
        :rules="keyRules"
      >
        <el-input :disabled="actionType === 'edit'" v-model="form.dictKey"></el-input>
      </el-form-item>
      <el-form-item v-for="locale in supportLocales" :key="locale.key"
                    :prop="'localeMap.'+locale.key"
                    :label="locale.value"
                    :rules="valueRules"
      >
        <el-input v-model="form.localeMap[locale.key]"></el-input>
      </el-form-item>
      <el-form-item
        prop="desc"
        :label="dict.label_desc"
        :rules="descRules"
      >
        <el-input v-model="form.desc"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button :loading="isLoading" type="primary" @click="submit">{{ dict.action_submit }}</el-button>
      </el-form-item>
    </el-form>
  </el-dialog>
</template>

<script>
import { mapState } from 'vuex'
import { add, query, queryForUpdate, update } from '@/api/dict'

export default {
  ///^(?!\d)[a-zA-Z0-9_]+$/
  data() {
    return {
      form: this.initForm(),
      visible: false,
      actionType: 'add',
    }
  },
  computed: {
    title() {
      return this.actionType === 'add' ? this.dict.title_add_dict : this.dict.title_edit_dict;
    },
    ...mapState({
      supportLocales: state => state.i18n.supportLocales,
    }),
    keyRules() {
      let keyValidator = (rule, value, callback) => {
        if(!/^(?!\d)[a-zA-Z0-9_]+$/.test(value))
          callback(new Error('请输入字母,数字和下划线'));
        else
          callback();
      }
      return [ this.requiredRule,
        { validator: keyValidator, trigger: 'blur' }
      ]
    },
    valueRules() {
      return [ this.requiredRule ]
    },
    descRules() {
      return [ this.requiredRule ]
    }
  },
  methods: {
    initForm() {
      return {
        dictKey: '',
        localeMap: {},
        desc: ''
      };
    },
    show(actionType, key) {
      this.visible = true;
      if(actionType === 'add' && this.actionType !== actionType) {
        this.form = this.initForm();
      } else {
        if(actionType === 'edit' && this.form.dictKey === key)
          return; //复用原来的页面数据
        queryForUpdate(key).then(resp => {
          if(this.isSucceed(resp)) {
            this.form = {
              dictKey: resp.data.key,
              localeMap: resp.data.localeValueMap,
              desc: resp.data.desc,
            }

          } else {
            this.$notify.error(resp.msg);
          }

        }).catch(err => {
          this.LOG('dict queryForUpdate err', err);
        })
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
        let params = {
          key: this.form.dictKey,
          localeValueMap: this.form.localeMap,
          desc: this.form.desc,
        }
        this.isLoading = true;
        let action = this.actionType === 'add' ? add : update;
        action(params).then(resp => {
          if(resp.code === '000000') {
            this.visible = false;
            this.$emit('updated');
            this.form = this.initForm(); //重置
          } else {
            this.$notify.error(resp.msg)
          }

          this.isLoading = false;
        }).catch(err => {
          this.LOG('add dict error', err);
          this.isLoading = false;
        })

      })

    },


  }

}

</script>
