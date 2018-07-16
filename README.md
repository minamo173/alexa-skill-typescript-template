Amazon AlexaのカスタムスキルをTypeScriptを使って開発するテンプレートです。

AWS Lambdaへのデプロイや、Alexaのスキルで扱うその他のAWSリソースの管理は、[AWS SAM (Serverless Application Model)](https://github.com/awslabs/serverless-application-model)を利用しています。

## 必要なもの
### AWS SAM CLI

+ [AWS SAM CLIのインストール](https://docs.aws.amazon.com/ja_jp/lambda/latest/dg/sam-cli-requirements.html)

### デプロイ先のAWSアカウントの認証情報の設定

+ [設定ファイルと認証情報ファイル](https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/cli-config-files.html)

## デプロイ
下記のコマンドでデプロイできます。

`$ sh deploy.sh`

このデプロイ用のシェルスクリプトで実行している内容は下記の通りです。

1. TypeScriptで作成したLambda関数を通常のJavaScriptファイルにビルド。
1. 上記でビルドしたLambda関数をパッケージング。
1. パッケージングした内容を指定のS3バケットへアップロード・そのURIを参照した `serverless-output.yaml` を自動生成。
1. `serverless-output.yaml`の内容に従って、AWS環境にデプロイ。

## 注意点
### `skill/src/` フォルダ内でのパッケージ管理について
型情報を参照するパッケージ（「`@types/`」から始まるパッケージなど）や、TypeScriptからJavaScriptにビルドした後のファイルで使用しないパッケージは、 `$ yarn add -D {packageName}` で `devDependencies` としてインストールすることをおすすめします。

（こうすることで、デプロイ時のLambda関数のファイルサイズを軽量に保つことができます。）
