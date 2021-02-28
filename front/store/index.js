export const state = () => ({
  loggedIn: false,
  current: {
    user: null
  }
})

export const getters = {}

export const mutations = {
  setLoggedIn (state, payload) {
    state.loggedIn = payload
  },
  setCurrentUser (state, palyload {
    state.current.user = payload
  })
}

export const actions = {
  login ({ commit }) {
    commit('setLoggedIn', true)
  },
  getCurrentUser({ commit }, user) {
    commit('setCurrentUser', true)
  }
