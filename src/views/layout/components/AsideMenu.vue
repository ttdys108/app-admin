<template>
    <el-menu
      class="border-0 w-100"
      background-color="#304156"
      text-color="#bfcbd9"
      active-text-color="#409eff"
      :collapse="collapse"
      :default-active="$route.path"
    >
      <el-menu-item class="avatar text-center pt-10" >
        <img v-if="!collapse" src="../../../assets/hjr.jpg">
      </el-menu-item>
      <menu-item v-for="menu in menus" :key="menu.id" :menu="menu" :index="menu.path" />
    </el-menu>

</template>

<script>
import MenuItem from './MenuItem'
import { mapState } from 'vuex'
import mixins from '@/mixins'

export default {
  components: {
    MenuItem
  },
  mixins: [
    mixins,
  ],
  props: {
    collapse: false
  },
  computed: {
    ...mapState({
      menus: state => state.menus.menus
    })
  },
  created() {
  }

}

</script>

<style scoped>
.avatar {
  height: 100px;
}
.avatar>img{
  width: 70px;
}

</style>
