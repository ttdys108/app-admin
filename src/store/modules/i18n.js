import Cookies from 'js-cookie'
import Config from '@/config'

//从数据字典查询所有i18n数据，按locale分组

const i18n = {
  namespaced: true,

  state: {
    locale: Cookies.get(Config.localeCookieAttr) || Config.defaultLocale,//当前locale
    dict: [], //当前dict
    totalDicts: {}, //格式: {'zh_CN':[], 'en': []}
    supportLocales: []
  },

  mutations: {
    setLocale: (state, locale) => {
      state.locale = locale;
      Cookies.set(Config.localeCookieAttr, locale);
      state.dict = state.totalDicts[locale];
    },
    setDicts: (state, dicts) => {
      state.totalDicts = dicts;
      state.dict = dicts[state.locale];
    },
    setSupportLocales: (state, locales) => {
      state.supportLocales = locales;
      console.log(locales)
    },

  },

  actions: {
    SET_DICTS({commit}, dicts) {
      commit('setDicts', dicts);
    },
    SET_LOCALE({commit}, locale) {
      commit('setLocale', locale);
    },
    SET_SUPPORT_LOCALES({commit}, locales) {
      commit('setSupportLocales', locales);
    }

  }

}

export default i18n;
