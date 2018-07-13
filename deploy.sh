#!/bin/sh

# TypeScriptで作成したLambda関数を通常のJavaScriptファイルにビルドする。
cd ./skill/src/
yarn build

# プロジェクトのルートディレクトリに戻る。
cd ../../

# 上記でビルドしたLambda関数をパッケージング・指定のS3バケットへアップロードする。
# （アップロードされたLambda関数を参照するyamlファイルを出力する。）
# TODO: 「アップロード先のS3バケット名」を編集する
sam package --template-file template.yaml \
--output-template-file serverless-output.yaml \
--s3-bucket 「アップロード先のS3バケット名」

# AWS環境にデプロイ
# TODO: 「スタック名」を編集する
sam deploy --template-file serverless-output.yaml \
--stack-name 「スタック名」 \
--capabilities=CAPABILITY_IAM
