import { mapState } from 'vuex'

export default {
  data() {
    return {
      loading: false, //el loading,
      pageNo: 1,
      pageSize: 10,
      totalCount: -1,
    }

  },
  computed: {
    ...mapState({
      dict: state => state.i18n.dict
             }),
    requiredRule() {
      return {
        required: true, message: this.dict.v_required, trigger: 'blur'
      }
    },
    requiredRuleChange() {
      return {
        required: true, message: this.dict.tips_select, trigger: 'change'
      }
    },
    commonCharRule() {
      return {
        pattern: /^(?!\d)[a-zA-Z0-9_]+$/, message: this.dict.tips_common_char, trigger: 'blur'
      }
    },
  },

  methods: {
    LOG(...info) { //测试用输出对象
      if(info.length === 0)
        return;
      console.log('-----'+ info[0] + '-----')
      info.shift();
      info.forEach(i => console.log(i));
      console.log('--------------------')
    },
    ERROR(...info) { //测试用输出对象
      if(info.length === 0)
        return;
      console.error('-----'+ info[0] + '-----')
      info.shift();
      info.forEach(i => console.error(i));
      console.error('--------------------')
    },
    SLEEP(millis) { //测试用
      let expires = new Date().getTime() + millis;
      while(true) {
        if(new Date() > expires)
          break;
      }
    },
    IS_EMPTY(val) { //方法名和el-tree冲突?
      if(val === null || val === undefined)
        return true;
      if(val === '' || val.trim() === '')
        return true;
      return false;
    },
    IS_SUCCEED(resp) {
      return resp && resp.code === '000000';
    },
    NOTIFY_SUCCEED() {
      this.$notify({
        message: this.dict.tips_submit_success,
        type: 'success'
      })
    }

  }


}
