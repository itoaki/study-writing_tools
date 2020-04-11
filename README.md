# writing-tools

文章の構成ルーツ群です

## 実行環境
リポジトリをcloneする端末にDockerがインストールされていることが前提です。

動作を確認しているDockerのバージョン
```
docker version
Client: Docker Engine - Community
 Version:           19.03.2
 API version:       1.40
 Go version:        go1.12.8
 Git commit:        6a30dfc
 Built:             Thu Aug 29 05:26:49 2019
 OS/Arch:           darwin/amd64
 Experimental:      false
```

## リポジトリのチェックアウト
```
git clone git@github.com:itoaki/writing_tools.git
```

## 校正ツール
### prh
表記ゆれを検出することができるツールです。
ルールはprh.ymlで定義します。
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
