import request from './request'

function queryAll(){
  return request({
    url: '/menu/all'
  })
}

export { queryAll }
