import request from '@/utils/request'

// 查询传感器 列表
export function listNode(query) {
  return request({
    url: '/system/node/list',
    method: 'get',
    params: query
  })
}

// 查询传感器 详细
export function getNode(terminalId) {
  return request({
    url: '/system/node/' + terminalId,
    method: 'get'
  })
}

// 新增传感器
export function addNode(data) {
  return request({
    url: '/system/node',
    method: 'post',
    data: data
  })
}

// 修改传感器
export function updateNode(data) {
  return request({
    url: '/system/node',
    method: 'put',
    data: data
  })
}

// 删除传感器
export function delNode(terminalId) {
  return request({
    url: '/system/node/' + terminalId,
    method: 'delete'
  })
}
