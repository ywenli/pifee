<template>
  <no-ssr>
    <mavon-editor
      ref="md"
      v-model="inputValue"
      language="ja"
      :subfield="false"
      :editable="false"
      :toolbarsFlag="false"
      :boxShadow="false"
      defaultOpen="preview"
      previewBackground="#fff"
      class="markdown__preview"
    />
  </no-ssr>
</template>
<script>
export default {
  name: 'MarkdownEditorPreview',
  props: {
    value: {
      type: null,
      required: false,
      default: ''
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
  }
}
</script>

<style>
.markdown__preview {
  padding: auto 12 auto;
  width: 100%;
  height: 70vh;
  position: relative;
    /* FIXME: z-indexが反映されてない */
  z-index: 0;
    /* FIXME: border:0 が反映されていない */
  border: 0;
  line-height: 1.9rem;
}
</style>
