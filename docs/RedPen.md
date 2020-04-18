# RedPenとは
RedPenは、読みづらい文章を検出することができるツールです。  
https://github.com/redpen-cc/redpen  
http://redpen.cc/docs/1.10/index.html  

#### サンプルを実行する

```
cd ./RedPen
docker build -t redpen .
docker run --rm -v $PWD:/work redpen --lang ja sample.md
```
実行結果
```
sample.md:1: ValidationError[CommaNumber], カンマの数 (4) が最大の "3" を超えています。 at line: 私は、読みやすい文章が、どうしても、書きたい、です。
```

#### ファイル形式を指定してチェック精度を向上させる
```
docker run --rm -v $PWD:/work redpen --lang ja --format Markdown sample.md
```

#### 出力フォーマットを変更する

```
docker run --rm -v $PWD:/work redpen --lang ja --result-format json sample.md
```
実行結果
```
[
  {
    "document":"sample.md",
    "errors":[
      {
        "sentence":"私は、読みやすい文章が、どうしても、書きたい、です。",
        "level":"Error",
        "validator":"CommaNumber",
        "lineNum":1,
        "sentenceStartColumnNum":0,
        "message":"カンマの数 (4) が最大の \"3\" を超えています。"
      }
    ]
  }
]
```

#### 終了ステータスと--limit

エラーが1つの時は0。2つ以上の時は1になるそうです。
```
cho $?
0
```
--limitで、挙動を制御できる。
```
docker run --rm -v $PWD:/work redpen --lang ja --limit 0 sample.md

sample.md:1: ValidationError[CommaNumber], カンマの数 (4) が最大の "3" を超えています。 at line: 私は、読みやすい文章が、どうしても、書きたい、です。

[2020-04-16 16:35:44][ERROR] cc.redpen.Main - The number of errors "1" is larger than specified (limit is "0").

# 終了ステータスが1になる
$?
1
```

#### redpen-conf.xml
redpen-conf.xmlに設定を追記しておくことで、チェック内容のカスタマイズができます。
```
docker run --rm -v $PWD:/work redpen --lang ja --conf redpen-conf.xml --limit 0 sample.md
```

#### redpen-conf.xmlの育て方
設定ファイルは「デフォルト設定」から不要なものを削っていくと良い。
デフォルト設定
```
docker run --rm -t --entrypoint=cat redpen /usr/local/conf/redpen-conf-ja.xml
```
