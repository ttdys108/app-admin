import axios from 'axios'
import Config from '@/config'
import { AuthUtils } from '@/utils'
import { Notification } from 'element-ui'

const request = axios.create({
  baseURL: process.env.API_HOST,
  timeout: Config.requestTimeout,
})

request.interceptors.request.use(
  config => {
    if(!config.headers['Content-Type'])
      config.headers['Content-Type'] = 'application/json';
    let loginToken = AuthUtils.getToken();
    if(loginToken)
      config.headers['Authorization'] =  loginToken;
    return config;
  }, err => {
    console.log(err);
    return Promise.reject(err);
  }
)

request.interceptors.response.use(
  response => {
    if(response.status === 200) {
      return response.data;

    } else {
      Notification.error({
        title: response.status,
        message: response
      })
      return response;
    }
  },
  err => {
    Notification.error({
      title: err
    })
    return Promise.reject(err);
  }



)

export default request;
