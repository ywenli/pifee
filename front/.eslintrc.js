module.exports = {
  env: {
    node: true,
    es6: true
  },
  extends: [
    'eslint:recommended',
    'plugin:vue/recommended',
    'plugin:vue-types/recommended',
    // 'prettier/vue',
    'plugin:prettier/recommended',
    '@nuxtjs/eslint-config-typescript'
  ],
  plugins: [
    'vue'
  ],
  parser: 'vue-eslint-parser',
  parserOptions: {
    sourceType: 'module',
    parser: 'babel-eslint'
  },
  root: true,
  rules: {
    // 'generator-star-spacing': 'off',
    // 'no-debugger': process.env.BASE_URL === 'production' ? 'error' : 'off',
    'prettier/prettier': 'off',
    'no-console': process.env.NODE_ENV === 'production' ? 'error' : 'off',
    'no-debugger': process.env.NODE_ENV === 'production' ? 'error' : 'off',
    // タグの最後を改行するか
    'vue/html-closing-bracket-newline': ['error', {
      singleline: 'never',
      multiline: 'always'
    }],
    // propsのtype宣言なし
    // "vue/require-prop-types": 'off',
    // propsの初期値は設定しない
    'vue-types/require-default-prop': 'off',
    // propsのアッパーケース(myProp)、ケバブケース(my-prop)の使用を可とする
    'vue/attribute-hyphenation': 'off',
    'vue/no-parsing-error': 'off',
    // 不要なカッコは消す
    'no-extra-parens': 'warn',
    // 無駄なスペースは削除
    'no-multi-spaces': 'error',
    // 使ってない変数があってもいい
    '@typescript-eslint/no-unused-vars': 'off',
    'vue/no-unused-vars': 'off',
    // html属性のクオート修正をoff (prettierと競合する設定)
    'vue/html-quotes': 'off'
  }
}
