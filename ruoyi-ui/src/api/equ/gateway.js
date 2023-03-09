import request from '@/utils/request'

// 查询网关列表
export function listGateway(query) {
  return request({
    url: '/system/gateway/list',
    method: 'get',
    params: query
  })
}

// 查询网关详细
export function getGateway(gatewayId) {
  return request({
    url: '/system/gateway/' + gatewayId,
    method: 'get'
  })
}

// 新增网关
export function addGateway(data) {
  return request({
    url: '/system/gateway',
    method: 'post',
    data: data
  })
}

// 修改网关
export function updateGateway(data) {
  return request({
    url: '/system/gateway',
    method: 'put',
    data: data
  })
}

// 删除网关
export function delGateway(gatewayId) {
  return request({
    url: '/system/gateway/' + gatewayId,
    method: 'delete'
  })
}

// 筛选网关下业务
export function terminalList(gatewayId) {
  return request({
    url: '/system/gateway/terminalList/' + gatewayId,
    method: 'get',
    // params: query
  })
 
}
  export function listInterface(query) {
    return request({
      url: '/system/interface/list',
      method: 'get',
      params: query
    })
  }

// 查询【请填写功能名称】详细
  export function getInterface(gwEui) {
    return request({
      url: '/system/interface/' + gwEui,
      method: 'get'
    })
  }






