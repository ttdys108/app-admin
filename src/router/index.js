import Vue from 'vue'
import Router from 'vue-router'
import Layout from '@/views/layout'
import Index from '@/views/index'
import Login from '@/views/login'
import NProgress from 'nprogress'
import 'nprogress/nprogress.css'// progress bar style
import { AuthUtils, PathUtils } from '@/utils'

import { queryAll as queryMenus } from '@/api/menu'
import { queryAll as queryDicts } from '@/api/dict'
import store from '@/store'

Vue.use(Router)

NProgress.configure({ showSpinner: false })// NProgress Configuration

const publicPaths = [
  // '/', '/index', '/dashboard', '/login'
]

const router = new Router({
  routes: [],
  inited: false
})

router.beforeEach((to, from, next) => {
  NProgress.start();
  //初始化
  if(!this.inited) {
    initRouter();
    initDict();
    this.inited = true;
  }

  //无需登录
  if(publicPaths.indexOf(to.path) >= 0) {
    next();

  }else if(!AuthUtils.isLogin()) {//未登录
    next({
      path: '/login',
      query: { redirect: to.fullPath }
    });
  } else {
    next();
  }
})

router.afterEach((to, from) => {
  if(store.state.menus.menus.length !== 0) //刚打开页面，menu没初始化好
    store.dispatch('menus/ADD_CACHE_MENU', to.path);
  NProgress.done();
})

function initDict() {
  queryDicts().then(resp => {
    store.dispatch('i18n/SET_DICTS', resp.data);
  });
}

function initRouter() {
  queryMenus().then(resp => {
    store.dispatch('menus/SET_MENUS', resp.data);
    let routes = [{
      path: '',
      component: Index
    }];
    resp.data.forEach(menu => {
      addRoutes(routes, menu)
    });
    let rootRoute = {
      path: '/',
      redirect: 'index',
      component: Layout,
      children: routes
    };
    router.addRoutes(
      [
        rootRoute,
        {
          path: '/login',
          component: Login
        }
      ]
    );
  })
}

function addRoutes(routes, menu) {
  if(menu.children) {
    menu.children.forEach(m => addRoutes(routes, m));
  } else {
    routes.push({
      path: menu.path,
      component: () => import('@/views' + menu.path)
    })
  }
}

export default router;
