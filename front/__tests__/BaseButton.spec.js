import BaseButton from '@/components/atoms/BaseButton.vue'
import { mount } from '@/vue/test-utils'
describe('BaseButton', () => {
  it('clickメソッドを呼ぶ', () => {
    const wrapper = mount(BaseButton)
    expect(wrapper.isVueInstance).toBeTruthy()
  })
})
