import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'
import Vuejs from '../../components/Vuejs.vue'

Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
    const app = new Vue({
        el: '#vuejs',
        data: {
            message: "Instância Vuejs"
        },
        components: {Vuejs}
    })
})