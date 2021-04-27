<template>
  <div>
    <mavon-editor
      ref="md"
      v-model="inputValue"
      class="mavonEditor"
      language="ja"
      :toolbars="markdownOption"
      :boxShadow="false"
      :subfield="false"
      defaultOpen="edit"
      placeholder="Write in Markdown"
      @imgAdd="$imgAdd"
    />
  </div>
</template>
<script>
export default {
  name: 'BaseMarkdown',
  props: {
    value: {
      type: null,
      required: false,
      default: ''
    }
  },
  data () {
    return {
      markdownOption: {
        bold: true,
        italic: true,
        header: true,
        underline: true,
        strikethrough: true,
        mark: true,
        quote: true,
        ol: true,
        ul: true,
        link: true,
        imagelink: true,
        code: true,
        table: true,
        preview: true
      },
      presignedObject: ''
    }
  },
  computed: {
    inputValue: {
      get () {
        return this.value
      },
      set (value) {
        this.$emit('input', value)
      }
    }
  },
  methods: {
    async $imgAdd (pos, $file) {
      // presigned_urlを取得
      // await this.getPresignedObject($file)

      // const presignedObject = await this.$axios.get('/api/v1/s3/ presigned_url', {
      //   filename: $file.name
      // })
      //   .then(res => res.data)
      //   .catch(err => console.log(err.message))

      const formData = new FormData()
      for (const key in this.presignedObject.fields) {
        formData.append(key, this.presignedObject.fields[key])
      }
      formData.append('file', $file)

      // 取得したpresigned_urlにpost
      await this.$axios.post(this.presignedObject.url, formData, {
        headers: {
          'Content-Type': 'multipart/form-data'
        }
      }).then((res) => {
        // XML形式で返ってきたデータのLocationタグの値をurlとして取得して使う
        const matchedObject = res.data.match(/<Location>(.*?)<\/Location>/)
        const s3Url = unescape(matchedObject[1])
        // s3urlをpositionとともにurlに変換
        this.$refs.md.$img2Url(pos, s3Url)
      })
        .catch(err => console.log(err.message))
    },
    async getPresignedObject ($file) {
      await this.$axios.get('/api/v1/s3/presigned_url', {
        filename: $file.name
      })
        .then((res) => {
          this.presignedObject = res.data
        })
        .catch(err => console.log(err.message))
    }
  }
}
</script>

<style scoped>
.mavonEditor {
  margin: auto;
  width: 100%;
  height: 100%;
  position: relative;
  z-index: 0;
}
</style>
