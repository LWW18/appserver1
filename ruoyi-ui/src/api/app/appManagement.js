import request from '@/utils/request'

// 查询应用列表
export function listAppManagement(query) {
  return request({
    url: '/app/appManagement/list',
    method: 'get',
    params: query
  })
}

// 查询应用详细
export function getAppManagement(appId) {
  return request({
    url: '/app/appManagement/' + appId,
    method: 'get'
  })
}

// 新增应用
export function addAppManagement(data) {
  return request({
    url: '/app/appManagement',
    method: 'post',
    data: data
  })
}

// 修改应用
export function updateAppManagement(data) {
  return request({
    url: '/app/appManagement',
    method: 'put',
    data: data
  })
}

// 删除应用
export function delAppManagement(appId) {
  return request({
    url: '/app/appManagement/' + appId,
    method: 'delete'
  })
}

// 状态修改
export function changeAppStatus(appId, authState) {
  const data = {
    appId,
    authState
  }
  return request({
    url: '/app/appManagement/changeStatus',
    method: 'put',
    data: data
  })
}

