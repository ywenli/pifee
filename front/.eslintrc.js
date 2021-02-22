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
    'prettier/prettier': 0,
    'no-console': process.env.NODE_ENV === 'production' ? 'error' : 'off',
    'no-debugger': process.env.NODE_ENV === 'production' ? 'error' : 'off',
    // タグの最後を改行するか
    'vue/html-closing-bracket-newline': ['error', {
      singleline: 'never',
      multiline: 'always'
    }],
    // propsのtype宣言なし
    // "vue/require-prop-types": 0,
    // propsの初期値は設定しない
    'vue-types/require-default-prop': 0,
    // propsのアッパーケース(myProp)、ケバブケース(my-prop)の使用を可とする
    'vue/attribute-hyphenation': 0,
    'vue/no-parsing-error': 0,
    // 不要なカッコは消す
    'no-extra-parens': 1,
    // 無駄なスペースは削除
    'no-multi-spaces': 2,
    // 使ってない変数があってもいい
    '@typescript-eslint/no-unused-vars': 0,
    'no-unused-vars': 0
  }
}
