<template>
  <el-popover
    width="160"
    v-model="visible"
  >
    <div @click="toggleScreen" class="w-100 setting-item p-0">
      <i class="el-icon-full-screen mr-10"></i><span class="cursor-d">{{ dict.fullscreen }}</span>
    </div>
    <i class="el-icon-setting" slot="reference"></i>
  </el-popover>

</template>

<script>
import screenfull from 'screenfull'
import mixins from '@/mixins'

export default {
  mixins: [
    mixins,
  ],
  data() {
    return {
      visible: false,
    }
  },
  methods: {
    toggleScreen() {
      this.visible = false;
      screenfull.toggle();
    }
  }


}


</script>

<style scoped>
.setting-item{
 font-size: 16px
}
.setting-item:hover{
  background-color: #fafafa;
}

</style>
