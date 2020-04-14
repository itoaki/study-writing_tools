表記ゆれを検出することができるツールです。<br>
ルールはprh.ymlで定義します。<br>
https://github.com/prh/prh

#### サンプルを実行する

```
cd ./prh
docker run --rm -v $PWD:/work prh sample.txt
```
実行結果
```
sample.txt(2,1): java → Java
sample.txt(3,1): jquery → jQuery
```

#### 正しい文章との差分を出力する
```
cd ./prh
docker run --rm -v $PWD:/work prh --diff sample.txt
```
実行結果
```
Index: sample.txt
===================================================================
--- sample.txt  before
+++ sample.txt  replaced
@@ -1,3 +1,3 @@
 職務経歴
-java：8年
-jquery：5年
+Java：8年
+jQuery：5年
```

#### 自動で置換する
```
cd ./prh
docker run --rm -v $PWD:/work prh --replace sample.txt
```
実行結果
```
replaced sample.txt
```

実行後のsample.txt
```
職務経歴
Java：8年
jQuery：5年
```

#### 外部定義ファイルをインポートする

prh.ymlのimportsで読み込みたいファイルを定義すると、定義ファイルが読み込まれます。
```prh.yml
imports:
  - ./prh-rules/media/techbooster.yml
```
