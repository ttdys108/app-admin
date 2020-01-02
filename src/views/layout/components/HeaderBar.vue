<template>
<el-row :style="'height:'+height">
  <div class="h-100 inline">
    <i :class="{'el-icon-s-fold': true, 'folded': folded}" @click="onFoldChange"></i>
    <span>{{ dict.index }}</span>
  </div>
  <div class="h-100 inline f-right">
    <locale-selector class="lang-sel"></locale-selector>
    <settings class="icon"></settings>
    <logout class="logout" />
  </div>

</el-row>

</template>

<script>
import { LocaleSelector, Logout, Settings } from '@/components'
import mixins from '@/mixins'

export default {
  name: 'HeaderBar',
  components: {
    LocaleSelector,
    Logout,
    Settings,
  },
  mixins: [
    mixins,
  ],
  props: {
    height: {
      type: String,
      default: '50px'
    }
  },
  data() {
    return {
      folded: false,
      lang: this.$store.state.i18n.locale
    }
  },
  created() {
  },
  methods: {
    onFoldChange() {
      this.folded = !this.folded;
      this.$emit('fold-change', this.folded);
    }

  }

}

</script>

<style scoped>
i{
  font-size: 30px;
  margin: 10px;
  transition: .38s;
  transform-origin: 50% 50%;
  cursor: pointer;
}
i.folded{
  transform: rotate(-180deg);
}
.icon{
  font-size: 30px;
  margin: 0 10px;
  line-height: 50px;
}
.lang-sel{
  position: relative;
  bottom: 6px;
}
.logout{
  position: relative;
  bottom: 3px;
}
</style>
