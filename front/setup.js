import Vue from 'vue'
import Vuetify from 'vuetify'

Vue.use(Vuetify)
Vue.config.devtools = false
Vue.config.productionTip = false

const app = document.createElement('div')
app.setAttribute('data-app', true)
document.body.appendChild(app)
