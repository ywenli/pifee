import BaseLikeButton from '@/components/atoms/BaseLikeButton'
import { createLocalVue, shallowMount } from '@vue/test-utils'
import axios from 'axios'
import Vuetify from 'vuetify'

const spyDeleteLike = jest.spyOn(BaseLikeButton.methods, 'deleteLike')
jest.mock('axios')

describe('BaseLikeButton', () => {
  const localVue = createLocalVue()
  let vuetify
  beforeEach(() => {
    vuetify = new Vuetify()
  })
  const wrapper = shallowMount(BaseLikeButton, {
    localVue,
    vuetify,
    sync: false,
    mocks: {
      $route: {
        params: {
          id: 1
        }
      },
      $axios: axios
    }
  })
  it.skip('created()でlikeListのデータを取ってくる', () => {
    const likeList = [{ id: 1, user_id: 1, work_id: 1 }]
    axios.get.mockResolvedValue(likeList)
    expect(axios.get).toHaveBeenCalledTimes(1)
  })
  it.skip('@clickでdeleteLike()が発火する', () => {
    wrapper.trigger('click')
    expect(spyDeleteLike).toHaveBeenCalledTimes(1)
  })
})
