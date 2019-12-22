import request from './request'

function login(params){
  return request({
    url: '/login',
    method: 'post',
    data: params
  })
}

function register(params) {
  return request({
    url: '/register',
    method: 'post',
    data: params
  })
}

export { login, register }
