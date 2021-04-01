export const state = () => ({
  current: {
    user: null
  },
  rememberRoute: {
    name: 'index',
    params: {}
  },
  toast: {
    msg: null,
    color: 'error',
    timeout: 2000
  }
})

export const getters = {}

export const mutations = {
  setCurrentUser (state, payload) {
    state.current.user = payload
  },
  setRememberRoute (state, payload) {
    state.rememberRoute = payload
  },
  setToast (state, payload) {
    state.toast = payload
  }
}

export const actions = {
  getCurrentUser ({ commit }, user) {
    commit('setCurrentUser', user)
  },
  getRememberRoute ({ commit }, route) {
    route = route || { name: 'index', params: {} }
    commit('setRememberRoute', { name: route.name, params: route.params })
  },
  getToast ({ commit }, toast) {
    toast.color = toast.color || 'error'
    toast.timeout = toast.timeout || 2000
    commit('setToast', toast)
  }
}
