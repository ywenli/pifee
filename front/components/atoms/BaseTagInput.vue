<template>
  <v-combobox
    v-model="inputValue"
    label="タグ"
    :search-input.sync="search"
    :items="items"
    append-icon
    chips
    deletable-chips
    class="tag-input"
    clearable
    hide-selected
    hint="タグは5つまで追加できます"
    multiple
    persistent-hint
    placeholder="タグを追加する"
    max-width="auto"
    @keyup.tab="updateTags"
    @paste="updateTags"
  >
    <template #no-data>
      <v-list-item>
        <v-list-item-title>
          "<strong>{{ search }}</strong>"タグはありません。<kbd>enter</kbd>を押してタグを追加てください。
        </v-list-item-title>
      </v-list-item>
    </template>
  </v-combobox>
</template>

<script>
export default {
  props: {
    value: {
      type: Array,
      default: () => []
    }
  },
  data () {
    return {
      tags: [],
      items: ['javascript', 'vue', 'react', 'nuxt', 'next', 'typescript'],
      search: null // sync search
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
  watch: {
    // タグが6つ以上追加できないようにする
    tags (val) {
      if (val.length > 5) {
        this.$nextTick(() => this.tags.pop())
      }
    }
  },
  methods: {
    updateTags () {
      this.$nextTick(() => {
        this.tags.push(...this.search.split(','))
        this.$nextTick(() => {
          this.tags = ''
        })
      })
    }
  }
}
</script>

<style>

</style>
