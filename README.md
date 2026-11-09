# Matlab workspace

Dockerを用いたMATLAB (R2025a) の開発・実行環境です。WebブラウザからMATLABにアクセスして利用することができます。

## 使い方

### 1. コンテナの起動

以下のコマンドを実行して、MATLABのコンテナをバックグラウンドで起動します（初回または `Dockerfile` 更新時はビルドが行われます）。

```bash
docker compose up -d --build
```
（2回目以降は `docker compose up -d` または `make up` で起動できます）

### 同梱・永続化されているToolbox / 設定
`Dockerfile` にて `mpm` (MathWorks Package Manager) を用いて以下のToolboxをプリインストールしています：
- `Statistics_and_Machine_Learning_Toolbox`
- `Deep_Learning_Toolbox`

新たにToolboxを追加したい場合は、`Dockerfile` の `ADDITIONAL_PRODUCTS` に追記して `docker compose up -d --build`（または `make build`）を実行してください。
また、ログイン情報や設定（`/home/matlab/.matlab`, `/home/matlab/.MathWorks`）もDockerボリュームに永続化されるため、`docker compose down` しても消えません。

### 2. MATLABへのアクセス

コンテナ起動後、Webブラウザを開き、以下のURLにアクセスしてください。

* http://localhost:8888

ブラウザ上でMATLABのインターフェースが表示され、操作することができます。

### 3. コンテナ内でのシェル実行 (開発用)

コンテナ内で直接コマンドを実行したい場合は、以下のコマンドを使用します。

```bash
make dev
```
(内部的には `docker compose exec matlab bash` が実行され、MATLABコンテナ内のbashシェルに入ります。)

### 4. コンテナの停止

利用が終了したら、以下のコマンドでコンテナを停止・削除します。

```bash
docker compose down
```

## ディレクトリ構成

ホストマシンの `./matlab_home/Documents/MATLAB` ディレクトリが、コンテナ内の `/home/matlab/Documents/MATLAB` にマウントされています。
このディレクトリに配置した `.m` ファイルなどのスクリプトは、MATLAB上から直接読み書きすることができます。

## 動作要件・リソース制限
* Docker および Docker Compose がインストールされていること。
* メモリ制限として 8GB (`memory: 8G`) 、共有メモリとして 4GB (`shm_size: 4G`) が `compose.yaml` にて設定されています。

## 注意

MP4出力ができなかった

AVIで出してffmpeg変換推奨
