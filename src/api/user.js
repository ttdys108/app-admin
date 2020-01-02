import request from './request'

function query(params){
  return request({
    url: '/user/query',
    params: params,
  })
}

function update(params){
  return request({
    url: '/user/update',
    method: 'post',
    data: params,
  })
}


export { query, update }
