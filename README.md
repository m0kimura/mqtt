MQTTブローカー(mosquitto)環境
====

Mqttブローカーであるmosquittoの環境を提供しています。


## 説明
  - MQTTのブローカーが起動されます。
  - mosquittoの環境は何もなくても起動します。
  - 設定が必要な場合は「.mosquitto.conf」をユーザールートに置くとコピーします。
  - Dockerイメージはリポジトリからダウンロードされます。
  - 起動関係のシェル(linux)がdocker.shに準備されています。


## 必要事項
  Dockerがインストールされている必要があります。


## 使い方

### まずはためしてみる(Helpなども表示されます)
  ./docker.sh

### コンテナを作成して、ブローカーを起動する
  ./docker.sh auto

### コンテナにログインする
  ./docker.sh login

### 既に作成されたコンテナを起動する
  ./docker.sh start

### コンテナを停止する
  ./docker.sh stop

### テストメッセージを発行する
  ログイン後、 lex pub 「トピックID」 「メッセージ」

### 待受してメッセージを確認する
  ログイン後、　lex wait 「トピックID」

### その他
  その他はHelps lexで確認シてください。


## インストール
  git clone https://github.com/m0kimura/mqtt.git


## 構成
  - Dockerfile ドッカー構築ファイル
  - README.md 解説
  - docker.sh ドッカー起動、管理シェル
  - starter.sh 開始時実行ソース
  - parts/Helps ヘルプ用シェル
  - parts/lex ローカル実行シェル
  - parts/monitrc モニター設定ファイル
  - parts/mosquitto.conf　mqttブローカー設定ファイル

## Licence

[MIT](https://github.com/tcnksm/tool/blob/master/LICENCE)


## Author

[m0kimura](https://github.com/m0kimura)

