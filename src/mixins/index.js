import { mapState } from 'vuex'

export default {
  data() {
    return {
      isLoading: false, //el loading,
    }

  },
  computed: {
    ...mapState({
      dict: state => state.i18n.dict
             })
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
    }

  }


}
