# Kubernetes Meetup Tokyo #61 Lightning Talk 補助資料
Kubernetes Meetup Tokyo #61のLightning Talkの補助資料です。

containerlabを使って作成したspineスイッチ2台、leafスイッチ4台のIP Closファブリックとkindで作成した4ノードからなるKubernetesクラスタを接続します。CNI pluginにはCiliumを使用し、ホストでもBGPを動かすRouting on the Hostの構成でCiliumのnative routingモードでpod間のネットワークを作るデモです。

## 準備
デモの実行には以下のソフトウェアをインストールしておく必要があります。

- [kind](https://kind.sigs.k8s.io/)
- [containerlab](https://containerlab.dev/)
- [Cilium CLI](https://github.com/cilium/cilium-cli)

## 実行方法
### デモ環境の作成
```
$ make deploy
```

これで、kindによるKubernetesクラスタの作成、containerlabによるIP Closファブリックの作成、Ciliumのインストールが行われます。

### デモ環境の削除
```
$ make destroy
```

containerlabで作成したIP Closファブリックの削除、kindで作成したKubernetesクラスタの削除が行われます。

### Ciliumの動作確認
```
$ cilium connectivity test
```

Cilium CLIで提供される接続性試験を実行します。

## テスト環境
kind

```
$ kind version
kind v0.22.0 go1.20.13 linux/amd64
```

Kubernetes
```
$ kubectl version
Client Version: v1.29.2
Kustomize Version: v5.0.4-0.20230601165947-6ce0bf390ce3
Server Version: v1.29.2
```

containerlab

```
$ containerlab version
  ____ ___  _   _ _____  _    ___ _   _ _____ ____  _       _
 / ___/ _ \| \ | |_   _|/ \  |_ _| \ | | ____|  _ \| | __ _| |__
| |  | | | |  \| | | | / _ \  | ||  \| |  _| | |_) | |/ _` | '_ \
| |__| |_| | |\  | | |/ ___ \ | || |\  | |___|  _ <| | (_| | |_) |
 \____\___/|_| \_| |_/_/   \_\___|_| \_|_____|_| \_\_|\__,_|_.__/

    version: 0.51.3
     commit: f11d4a93
       date: 2024-02-22T16:17:22Z
     source: https://github.com/srl-labs/containerlab
 rel. notes: https://containerlab.dev/rn/0.51/#0513
```

Cilium

```
$ cilium version
cilium-cli: v0.15.23 compiled with go1.22.0 on linux/amd64
cilium image (default): v1.15.0
cilium image (stable): v1.15.1
cilium image (running): 1.15.1
```
