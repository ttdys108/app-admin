import { mapState } from 'vuex'

export default {
  data() {
    return {
      isLoading: false, //el loading,
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
    }
  },

  methods: {
    LOG(...info) { //测试用输出对象
      if(info.length === 0)
        return;
      if(info.length === 1) {
        console.log(info[0]);
        return;
      }
      console.log('-----'+ info[0] + '-----')
      info.shift();
      info.forEach(i => console.log(i));
      console.log('--------------------')
    },
    sleep(millis) { //测试用
      let expires = new Date().getTime() + millis;
      while(true) {
        if(new Date() > expires)
          break;
      }
    },
    isEmpty(val) {
      if(val === null || val === undefined)
        return true;
      if(val === '' || val.trim() === '')
        return true;
      return false;
    },
    isSucceed(resp) {
      return resp && resp.code === '000000';
    }

  }


}
