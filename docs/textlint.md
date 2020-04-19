# textlintとは
textlintとは、プラグインを自分で選択して、「同じ助詞の使用」「冗長な表現」「弱い表現」などを検出します。
https://github.com/textlint/textlint
https://textlint.github.io/docs/getting-started.html

#### サンプルを実行する

```
cd ./samples/textlint/
docker build -t textlint .
docker run --rm -v $PWD:/work textlint --preset preset-ja-technical-writing sample.md
```
実行結果
```
/work/sample.md
  1:14  ✓ error  "することができます"は冗長な表現です。"することが"を省き簡潔な表現にすると文章が明瞭になります。参考: http://qiita.com/takahi-i/items/a93dc2ff42af6b93f6e0  ja-technical-writing/ja-no-redundant-expression

✖ 1 problem (1 error, 0 warnings)
✓ 1 fixable problem.
Try to run: $ textlint --fix [file]
```

#### 出力フォーマットを変更する
指定できるフォーマット：compact, jslint-xml, json, junit, pretty-error

```
docker run --rm -v $PWD:/work textlint --preset preset-ja-technical-writing --format checkstyle sample.md
```
実行結果
```
<?xml version="1.0" encoding="utf-8"?><checkstyle version="4.3">
  <file name="/work/sample.md">
    <error line="1" column="14" severity="error" message="&quot;することができます&quot;は冗長な表現です。&quot;することが&quot;を省き簡潔な表現にすると文章が明瞭になります。参考: http://qiita.com/takahi-i/items/a93dc2ff42af6b93f6e0 (ja-technical-writing/ja-no-redundant-expression)" source="eslint.rules.ja-technical-writing/ja-no-redundant-expression" />
  </file>
</checkstyle>
```
#### エラーの自動修正
--fix を指定すると、ファイルを自動で修正する  
```
docker run --rm -v $PWD:/work textlint --preset preset-ja-technical-writing --fix sample.md
```
実行後、sample.mdが更新されている。
```
我々は読みやすい文章を執筆できます。
```

#### 終了ステータス

エラーの時は1、エラーがない時は0です。  
textlintのエラーコードはシンプルで良いですね。  
```
cho $?
0
```

#### .textlintrcでルールを定義する
--presetで定義していたプラグインを.textlintrcに定義することができます。  
コンフィグファイルを修正するだけでよくなるので便利です。  
```
docker run --rm -v $PWD:/work textlint --config .textlintrc sample.md
```

設定できるプリセット一覧は[こちら](https://github.com/textlint/textlint/wiki/Collection-of-textlint-rule#rule-presets-japanese)  
