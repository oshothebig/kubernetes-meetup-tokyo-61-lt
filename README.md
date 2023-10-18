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
kind v0.20.0 go1.20.4 linux/amd64
```

Kubernetes
```
$ kubectl version --short
Flag --short has been deprecated, and will be removed in the future. The --short output will become the default.
Client Version: v1.27.1
Kustomize Version: v5.0.1
Server Version: v1.27.3
```

containerlab

```
$ containerlab version

                           _                   _       _
                 _        (_)                 | |     | |
 ____ ___  ____ | |_  ____ _ ____   ____  ____| | ____| | _
/ ___) _ \|  _ \|  _)/ _  | |  _ \ / _  )/ ___) |/ _  | || \
( (__| |_|| | | | |_( ( | | | | | ( (/ /| |   | ( ( | | |_) )
\____)___/|_| |_|\___)_||_|_|_| |_|\____)_|   |_|\_||_|____/

    version: 0.46.2
     commit: 0106f787
       date: 2023-10-12T10:14:39Z
     source: https://github.com/srl-labs/containerlab
 rel. notes: https://containerlab.dev/rn/0.46/#0462
```

Cilium

```
$ cilium version
cilium-cli: v0.15.10 compiled with go1.21.2 on linux/amd64
cilium image (default): v1.14.2
cilium image (stable): v1.14.2
cilium image (running): 1.13.7
```
