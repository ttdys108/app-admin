import request from './request'

function queryAll(){
  return request({
    url: '/dict/all'
  })
}

export { queryAll }
