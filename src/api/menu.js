import request from './request'

function queryAll(){
  return request({
    url: '/menu/all'
  })
}

function queryStatus(){
  return request({
    url: '/menu/status'
  })
}

function add(params){
  return request({
    url: '/menu/add',
    method: 'post',
    data: params
  })
}

function update(params){
  return request({
    url: '/menu/update',
    method: 'post',
    data: params
  })
}

function del(id){
  return request({
    url: '/menu/delete?id='+id,
    method: 'post',
  })
}

export { queryAll, queryStatus, add, update, del }
