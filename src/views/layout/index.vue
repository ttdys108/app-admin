<template>
  <el-container class="h-100">
    <!-- 左侧菜单栏 -->
    <el-aside :class="{'nav-menu':true, 'collapse': collapse}">
        <aside-menu :collapse="collapse"/>
    </el-aside>

    <el-container>
      <!-- 顶部菜单栏 -->
      <el-header height="85px" class="bg-white box-shadow">
        <header-bar @fold-change="collapse=!collapse" />
        <tags-bar />
      </el-header>

      <!-- router view -->
      <el-main>
        <router-view />
      </el-main>
    </el-container>
  </el-container>




</template>

<script>
import HeaderBar from './components/HeaderBar'
import TagsBar from './components/TagsBar'
import AsideMenu from './components/AsideMenu'

export default {
  name: 'Layout',
  components: {
    HeaderBar,
    TagsBar,
    AsideMenu
  },
  data() {
    return {
      collapse: false
    }
  },
  computed: {
  },
  created(){
  }


}

</script>

<style scoped>
.nav-menu{
  background-color: #304156;
  color: #bfcbd9;
  transition-duration: 0.38s;
  width: 170px!important;
}
.nav-menu.collapse{
  width: 56px!important;
}
</style>
