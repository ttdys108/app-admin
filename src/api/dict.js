import request from './request'

function queryAll(){
  return request({
    url: '/dict/all'
  })
}

function query(params) {
  return request({
    url: '/dict/query',
    params: params
  })

}

function queryForUpdate(key) {
  return request({
    url: '/dict/queryForUpdate?key=' + key,
  })
}

function update(params) {
  return request({
    url: '/dict/update',
    method: 'post',
    data: params,
  })
}

function add(params) {
  return request({
    url: '/dict/add',
    method: 'post',
    data: params,
  })
}

function del(key) {
  return request({
    url: '/dict/delete?key=' + key,
    method: 'post'
  })
}


export { queryAll, query, add, del, queryForUpdate, update }
