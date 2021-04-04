import BaseCardForDashboard from '@/components/atoms/BaseCardForDashboard.vue'
import { createLocalVue, shallowMount } from '@vue/test-utils'

describe('BaseCardForDashboard', () => {
  const localVue = createLocalVue()

  it('propsを受け取ることができる', () => {
    const wrapper = shallowMount(BaseCardForDashboard, {
      localVue,
      stubs: {
        'v-card': true
      },
      propsData: {
        to: '/',
        isPublic: false
      }
    })
    expect(wrapper.vm.$props.to).toBe('/')
    expect(wrapper.vm.$props.isPublic).toBe(false)
  })
})
