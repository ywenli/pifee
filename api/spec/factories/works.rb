FactoryBot.define do
  factory :work do
    sequence(:title) { |n| "タイトル #{n}" }
    body { "# 見出し1\n**複素数体**であれば、*任意のCM-タイプ*の A は、実際、++数体である定義体++（英語版）(==field of definition==)を持っている。自己準同型環の可能なタイプは、対合（ロサチの対合（英語版）(Rosati involution）をもつ環として既に分類さ\n## 見出し2\n1. リスト1\n2. リスト2\n3. リスト3\n### 見出し3\n- リスト1\n- リスト2\n- リスト3\n- \n#### 見出し4\n```1行のコード```\n\n```js:javascript\n複数のコード\n複数のコード\n複数のコード\n```\n##### 見出し5\n[google](https://google.com)\n\n###### 見出し6\n|column1|column2|column3|\n|-|-|-|\n|content1|content2|content3|\n\n\n" }
    is_public { 1 }
    user_id { 2 }
  end
end
