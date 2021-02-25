/* eslint-disable import/namespace */
/* eslint-disable no-undef */
import { extend, localize, ValidationObserver, ValidationProvider } from 'vee-validate' // 使用する機能
import ja from 'vee-validate/dist/locale/ja.json' // エラーメッセージの日本語化用
import * as rules from 'vee-validate/dist/rules' // 全てのバリデーションルール
import Vue from 'vue'

// forループで全てのバリデーションルールをextendで登録する
for (const rule in rules) {
  extend(rule, rules[rule])
}

Vue.component('ValidationProvider', ValidationProvider)
Vue.component('ValidationObserver', ValidationObserver)
localize('ja', ja)
