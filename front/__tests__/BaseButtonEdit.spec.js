import BaseButtonEdit from '@/components/atoms/BaseButtonEdit.vue'
import { createLocalVue, shallowMount } from '@vue/test-utils'
import Vuetify from 'vuetify'

describe('BaseButtonEdit', () => {
  const localVue = createLocalVue()
  let vuetify

  beforeEach(() => {
    vuetify = new Vuetify()
  })

  it('propsを受け取ることができる', () => {
    const wrapper = shallowMount(BaseButtonEdit, {
      localVue,
      vuetify,
      propsData: {
        to: '/'
      }
    })
    expect(wrapper.vm.$props.to).toBe('/')
  })
})
