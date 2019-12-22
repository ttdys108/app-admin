<template>
  <fragment>
      <el-submenu v-if="menu.children" :index="menu.path" >
        <template slot="title">
          <i :class="menu.icon"></i>
          <span>{{ dict[menu.code] }}</span>
        </template>
        <menu-item v-for="child in menu.children" :key="child.id" :menu="child" :index="child.path"></menu-item>

      </el-submenu>
      <router-link v-else :to="menu.path">
        <el-menu-item :index="menu.path">
          <i :class="menu.icon"></i>
          <span slot="title">{{ dict[menu.code] }}</span>
        </el-menu-item>
      </router-link>
  </fragment>

</template>

<script>
import { mapState } from 'vuex'

export default {
  name: 'menu-item',
  props: {
    menu: {
      type: Object,
      required: true
    },
    index: {
      type: String,
      required: true
    }
  },
  data() {
    return {}
  },
  computed: {
    ...mapState({
      dict: state => state.i18n.dict
    })
  },
  created() {
  },

  methods: {


  }



}

</script>

<style scoped>
.el-tooltip{
  padding: 0!important;
}

</style>
