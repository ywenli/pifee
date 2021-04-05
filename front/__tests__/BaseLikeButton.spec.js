import BaseLikeButton from '@/components/atoms/BaseLikeButton'
import { createLocalVue, shallowMount } from '@vue/test-utils'
import axios from 'axios'
import flushPromises from 'flush-promises'
import Vuetify from 'vuetify'
const likeList = [{ id: 1, user_id: 1, work_id: 1 }]

// const spyDeleteLike = jest.spyOn(BaseLikeButton.methods, 'deleteLike')
// const spyCountLike = jest.spyOn(BaseLikeButton.methods, 'countLike')
// const spyIsLiked = jest.spyOn(BaseLikeButton.methods, 'isLiked')

jest.mock('axios')

describe('BaseLikeButton', () => {
  const localVue = createLocalVue()
  localVue.prototype.$axios = axios
  let vuetify
  beforeEach(() => {
    vuetify = new Vuetify()
  })
  const wrapper = shallowMount(BaseLikeButton, {
    localVue,
    vuetify,
    mocks: {
      $route: {
        params: {
          id: 1
        }
      }
    }
  })

  it('created()でlikeListのデータを取ってくる', async () => {
    axios.get.mockImplementation(() => { return Promise.resolve(likeList) })
    await flushPromises()
    expect(axios.get).toHaveBeenCalledTimes(1)
  })

  it('いいね数が表示される', () => {
    wrapper.vm.$data.likeList = likeList
    expect(wrapper.vm.likeList.length).toBe(1)
    expect(wrapper.vm.countLike).toBe(1)
  })

  it.skip('@clickでregisterLike()が発火する', async () => {
    const likeList = [{ id: 1, user_id: 1, work_id: 1 }]
    const wrapper = shallowMount(BaseLikeButton)

    const spyRegisterLike = jest.spyOn(wrapper.vm, 'registerLike').mockResolvedValue({ likeList })
    // wrapper.vm.likeList = []
    // const registerLike = jest.fn().mockResolvedValue({ data: { likeList } })
    // wrapper.setMethods({ registerLike })
    wrapper.find('.button__unlike').trigger('click')
    await flushPromises()
    expect(spyRegisterLike).toHaveBeenCalled()
    expect(wrapper.vm.likeList.length).toEqual(1)
  })

  it.skip('@clickでdeleteLike()が発火する', () => {

  })
})
