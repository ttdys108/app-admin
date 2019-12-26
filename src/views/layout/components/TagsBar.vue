<template>
<el-row class="tags-bar" :style="'height:'+height">
  <el-tag @close="$store.dispatch('menus/REMOVE_CACHE_MENU', menu.path)" @click="$router.push(menu.path)" class="tags cursor-p" effect="dark" closable
          v-for="menu in cachedMenus" :key="menu.id">{{ dict[menu.code] }}</el-tag>
</el-row>

</template>

<script>
import { mapState } from 'vuex'

export default {
  name: 'TagsBar',
  props: {
    height: {
      type: String,
      default: '30px'
    }
  },
  data() {
    return {
    }

  },
  computed: {
    ...mapState({
      cachedMenus: state => state.menus.cached
    })

  },
  created() {
    // this.LOG('cache', this.cachedMenus);
  },
  methods: {

  }
}

</script>

<style scoped>
.tags-bar{
  margin: 0 -20px;
  border-top: 1px solid #f1f1f1;
}
.tags{
  border-radius: 0;
  height: 25px;
  line-height: 25px;
  margin-top: 5px;
  margin-left: 15px;
}
</style>
