import request from './request'

function queryAll(){
  return request({
    url: '/config/all'
  })
}

function query(params){
  return request({
    url: '/config/query',
    params: params
  })
}

export { queryAll, query }
