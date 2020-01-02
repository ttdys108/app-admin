import request from './request'

function queryAuthr(userId){
  return request({
    url: '/authr/query?userId=' + userId,
  })
}

function grant(params) {
  return request({
    url: '/authr/grant',
    method: 'post',
    data: params,
  })

}

export { queryAuthr, grant }
