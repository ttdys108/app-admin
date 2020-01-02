// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import ElementUI from 'element-ui'
import store from './store'
import Fragment from 'vue-fragment'
import elTableInfiniteScroll from 'el-table-infinite-scroll';

import 'element-ui/lib/theme-chalk/index.css'
import '@/style/admin.css'

Vue.config.productionTip = false

Vue.use(ElementUI)
Vue.use(Fragment.Plugin)
Vue.use(elTableInfiniteScroll)

/* eslint-disable no-new */
let v = new Vue({
  el: '#app',
  router,
  store,
  render: h => h(App)
})
