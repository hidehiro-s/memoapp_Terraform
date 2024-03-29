# 概要
Terraformを学習しました。
CloudFormationで作成したメモアプリ用の環境と同じものをTerraformで作成したものです。
Terraform Version 0.14.2

# 構成
・東京リージョンで単一VPCを作成しました。構成図は下記にあります。

# 環境
・Amazon Linux 2 (ami-00f045aed21a55240)

# メモ
variableを使用してインスタンスタイプ等を選択できるようにしたい。

# 参考
・[HashiCorpTerraform|Registry](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

・[Pragmatic Terraform on AWS サンプルコード](https://github.com/tmknom/example-pragmatic-terraform-on-aws)

・[実践Terraform](https://www.amazon.co.jp/dp/B07XT7LJLC/ref=dp-kindle-redirect?_encoding=UTF8&btkr=1)

・[Developers.IO](https://dev.classmethod.jp/articles/terraform-getting-started-with-aws/)

# 構成図
[draw.io](https://app.diagrams.net/)で構成図を作成しました。

<img width="441" alt="スクリーンショット 2020-05-19 23 45 08" src="https://user-images.githubusercontent.com/57721813/82341717-bccc5380-9a2b-11ea-8874-21fdf333df6e.png">
