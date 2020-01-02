<template>
  <el-select :style="selectStyle" v-model="currentLocale" @change="$store.dispatch('i18n/SET_LOCALE', currentLocale)">
    <el-option v-for="locale in locales" :key="locale.id" :label="locale.value" :value="locale.key" />
  </el-select>


</template>

<script>
import { query } from '@/api/config'
import mixins from '@/mixins'

export default {
  name: 'locale-selector',
  mixins: [
    mixins,
  ],
  props: {
    width: {
      type: String,
      default: '100px'
    }
  },
  data() {
    return {
      currentLocale: this.$store.state.i18n.locale,
      locales: [],
      selectStyle: {
        width: this.width
      }
    }
  },

  created() {
    query({
      type: 'lang'
    }).then(resp => {
      this.locales = resp.data;
      this.$store.dispatch('i18n/SET_SUPPORT_LOCALES', resp.data);
    })

  }



}

</script>
