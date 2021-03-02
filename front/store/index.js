export const state = () => ({
  current: {
    user: null
  }
})

export const getters = {}

export const mutations = {
  setCurrentUser (state, payload) {
    state.current.user = payload
  }
}

export const actions = {
  getCurrentUser ({ commit }, user) {
    commit('setCurrentUser', user)
  }
}
