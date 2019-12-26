import { queryAll } from '@/api/menu'

const menus = {
  namespaced: true,

  state: {
    menus: [],
    menuMap: {}, //path-menu的map，方便查询
    cached: []
  },
  mutations: {
    setMenus: (state, menus) => {
      state.menus = menus;
      let generateMap = (menus, map) => {
        for(let menu of menus) {
          map[menu.path] = menu;
          if(menu.children)
            generateMap(menu.children, map);
        }
      }
      generateMap(state.menus, state.menuMap);
    },
    addCache: (state, path) => {
      if(state.cached.some( m => m.path === path))
        return;
      let menu = state.menuMap[path];
      menu && state.cached.push(menu);
    },
    removeCache: (state, path) => {
      for(let i in state.cached) {
        if(state.cached[i].path === path) {
          state.cached.splice(i, 1);
          break;
        }
      }
    },

  },
  actions: {
    SET_MENUS({commit}, menus) {
      commit('setMenus', menus);
    },
    ADD_CACHE_MENU({commit}, path) {
      commit('addCache', path);
    },
    REMOVE_CACHE_MENU({commit}, path) {
      commit('removeCache', path);
    },
    RELOAD_MENUS({commit}) {
      queryAll().then(resp => {
        commit('setMenus', resp.data);
      }).catch(err => {
        console.error(err);
      })
    },
  }

}

export default menus;
