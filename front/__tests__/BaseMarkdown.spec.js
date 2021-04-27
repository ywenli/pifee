import BaseMarkdown from '@/components/atoms/BaseMarkdown.vue'
import { createLocalVue, shallowMount } from '@vue/test-utils'
import flushPromises from 'flush-promises'
import Vuetify from 'vuetify'
const localVue = createLocalVue()

const axios = {
  get: () => {
    return Promise.resolve(response)
  },
  post: () => {
    return Promise.resolve(xmlResponse)
  }
}
const response =
  {
    url: 'https://pifee-body-image.s3.ap-northeast-1.amazonaws.com',
    fields: {
      key: 'xxx',
      success_action_status: '201',
      acl: 'public-read',
      policy: 'xxx',
      'x-amz-credential': 'xxx',
      'x-amz-algorithm': 'xxx',
      'x-amz-date': 'xxx',
      'x-amz-signature': 'xxx'
    }
  }
const xmlResponse = '<?xml version="1.0" encoding="UTF-8"?><PostResponse><Location>https://pifee-body-image.s3.ap-northeast-1.amazonaws.com/body_image%xxx</Location><Bucket>pifee-body-image</Bucket><Key>body_image/xxx/</Key><ETag>"xxx"</ETag></PostResponse>'

describe('BaseMarkdown', () => {
  let vuetify
  let wrapper

  beforeEach(() => {
    vuetify = new Vuetify()
    wrapper = shallowMount(BaseMarkdown, {
      localVue,
      vuetify,
      mocks: {
        $axios: axios
      }
    })
  })

  // TODO: テストが不十分なので修正する
  it('getPresignedObject: presigned_urlを取得する', async () => {
    const $file = { name: 'hoge.jpg' }
    wrapper.vm.getPresignedObject($file)
    await flushPromises()

    console.log(wrapper.presignedObject)
    // expect(wrapper.presignedObject).toEqual(response)
  })
})
