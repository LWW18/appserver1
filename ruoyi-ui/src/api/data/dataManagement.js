import request from '@/utils/request'

// 查询appserver帧数据列表
export function listDataManagement(query) {
  return request({
    url: '/data/dataManagement/list',
    method: 'get',
    params: query
  })
}

// 查询appserver帧数据详细
export function getDataManagement(dataId) {
  return request({
    url: '/data/dataManagement/' + dataId,
    method: 'get'
  })
}

// 新增appserver帧数据
export function addDataManagement(data) {
  return request({
    url: '/data/dataManagement',
    method: 'post',
    data: data
  })
}

// 修改appserver帧数据
export function updateDataManagement(data) {
  return request({
    url: '/data/dataManagement',
    method: 'put',
    data: data
  })
}

// 删除appserver帧数据
export function delDataManagement(dataId) {
  return request({
    url: '/data/dataManagement/' + dataId,
    method: 'delete'
  })
}

// 查询warnning数据列表
export function listWarning(query) {
  return request({
    url: '/data/dataManagement/warningList',
    method: 'get',
    params: query
  })
}

// 查询data数据列表(不分页)
export function listAllData(query) {
  return request({
    url: '/data/dataManagement/AllDatalist',
    method: 'get',
    params: query
  })
}

// 首页
export function listPageViews(query) {
  return request({
    url: '/data/dataManagement/viewNum',
    method: 'get',
    params: query
  })
}