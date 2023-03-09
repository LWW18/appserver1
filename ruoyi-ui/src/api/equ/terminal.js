import request from '@/utils/request'

// 查询终端列表
export function listTerminal(query) {
  return request({
    url: '/equ/terminal/list',
    method: 'get',
    params: query
  })
}

// 查询终端详细
export function getTerminal(snId) {
  return request({
    url: '/equ/terminal/' + snId,
    method: 'get'
  })
}

// 新增终端
export function addTerminal(data) {
  return request({
    url: '/equ/terminal',
    method: 'post',
    data: data
  })
}

// 修改终端
export function updateTerminal(data) {
  return request({
    url: '/equ/terminal',
    method: 'put',
    data: data
  })
}

// 删除终端
export function delTerminal(snId) {
  return request({
    url: '/equ/terminal/' + snId,
    method: 'delete'
  })
}

// 查询App
export function appSelect() {
  return request({
    url: '/equ/terminal/appList',
    method: 'get'
  })
}

// 终端类型
export function terminalType(query) {
  return request({
    url: '/equ/terminal/terlist',
    method: 'get',
    params: query
  })
}

// 终端状态
export function runStateList(query) {
  return request({
    url: '/equ/terminal/runStateList',
    method: 'get',
    params: query
  })
}


// 查询【业务】列表
export function listReturn(query) {
  return request({
    url: '/system/return/list',
    method: 'get',
    params: query
  })
}

// 查询【业务】详细
export function getReturn(returnId) {
  return request({
    url: '/system/return/' + returnId,
    method: 'get'
  })
}

// 查询【业务】详细
export function getReturnList(terminalEui) {
  return request({
    url: '/system/return/list/' + terminalEui,
    method: 'get'
  })
}

// 修改【业务】
export function updateReturn(data) {
  return request({
    url: '/system/return',
    method: 'put',
    data: data
  })
}

// 校准
export function calibrateTerminal(data) {
  return request({
    url: '/equ/terminal/calibration',
    method: 'post',
    data: data
  })
}