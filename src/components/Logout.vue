<template>
  <!--<span class="inline cursor-p" @click="logout">-->
    <!--{{ dict.logout }}-->
  <!--</span>-->
  <el-popover
    width="160"
    v-model="visible">
    <p>{{ dict.logout_tips }}</p>
    <div style="text-align: right; margin: 0">
      <el-button size="mini" type="text" @click="visible = false">{{ dict.cancel }}</el-button>
      <el-button type="primary" size="mini" @click="logout">{{ dict.confirm }}</el-button>
    </div>
    <span class="inline cursor-p" slot="reference">{{ dict.logout }}</span>
  </el-popover>
</template>
<script>
import { AuthUtils } from "@/utils";
import mixins from '@/mixins'

export default {
  name: 'Logout',
  mixins: [
    mixins,
  ],
  data() {
    return {
      visible: false,
    }
  },
  methods: {
    logout() {
      this.visibility = false;
      AuthUtils.removeToken();
      this.$emit('logout');
      this.$router.push({
        path: '/login'
      })
    }
  }



}

</script>
