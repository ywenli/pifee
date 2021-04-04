import BaseButton from '@/components/atoms/BaseButton.vue'
import { createLocalVue, shallowMount } from '@vue/test-utils'
import Vuetify from 'vuetify'

describe('BaseButton', () => {
  const localVue = createLocalVue()
  let vuetify

  beforeEach(() => {
    vuetify = new Vuetify()
  })

  it('clickメソッドを呼ぶ', () => {
    const wrapper = shallowMount(BaseButton, {
      localVue,
      vuetify
    })

    wrapper.vm.click()
    expect(wrapper.emitted('click')).not.toBeUndefined()
    expect(wrapper.emitted('click')).toBeTruthy()
    expect(wrapper.emitted('click').length).toBe(1)
  })
  it('propsを受け取ることができる', () => {
    const wrapper = shallowMount(BaseButton, {
      localVue,
      vuetify,
      propsData: {
        color: 'primary',
        to: '/'
      }
    })
    expect(wrapper.vm.$props.color).toBe('primary')
    expect(wrapper.vm.$props.to).toBe('/')
  })
})
