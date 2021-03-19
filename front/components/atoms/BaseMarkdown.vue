<template>
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
</template>
<script>
export default {
  name: 'MarkdownEditor',
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
        trash: true
      }
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
    $imgAdd (pos, $file) {
      const formdata = new FormData()
      formdata.append('image', $file)
      this.$axios({
        url: 'server url',
        method: 'post',
        data: formdata,
        headers: { 'Content-Type': 'multipart/form-data' }
      }).then((url) => {
        this.$refs.md.$img2Url(pos, url)
      })
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
