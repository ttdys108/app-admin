import Cookies from 'js-cookie'
import Config from '@/config'

const AuthUtils = {
  isLogin() {
    return !!this.getToken();
  },
  getToken() {
    return Cookies.get(Config.tokenCookieAttr);
  },
  setToken(token, rememberMe) {
    let attr = (rememberMe ? { expires: 30 } : undefined);//记住账号，30天有效期
    Cookies.set(Config.tokenCookieAttr, token, attr);
  },
  removeToken() {
    Cookies.remove(Config.tokenCookieAttr);
  },


}

const PathUtils = {
  concat(pre, suf) { //处理前后缀'/'
    pre = pre.replace(/\/$/, '');
    suf = suf.replace(/^\//, '');
    return pre + '/' + suf;
  }

}

export { AuthUtils, PathUtils }
