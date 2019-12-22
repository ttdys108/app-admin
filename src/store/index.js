import Vue from 'vue'
import Vuex from 'vuex'

import i18n from './modules/i18n'
import menus from './modules/menus'

Vue.use(Vuex)

const store = new Vuex.Store({
  modules: {
    i18n,
    menus
  }


})

export default store;
