SUMMARY
=====
nvidiaの提供するimageにpythonなどの作業で必要なパッケージ類を追加して
すぐにjupyterlab上で作業が開始できるようにします。

もしくはこのイメージをベースにさらに追加パッケージを設定して作業のベースとすることができます。
その場合、このイメージをビルドした上でDockerfileで
```
FROM gpu-enabled-ubuntu-20.04-jupyterlab-base
RUN (なにがしかのコマンド)
```
のようにすれば良い。もちろんこのDockerfileを直接編集しても良い。

HOW TO USE
=====
イメージのビルド
-----
1. make IMAGE

Jupyterlabを起動する場合
-----
1. make RUN-JUPYTERLAB
2. URLが表示されるのでブラウザでアクセスする

コンテナにログインしてターミナルで作業する場合
-----
1. make RUN-CONSOLE

NOTES
=====
ベースのOSやCUDAバージョンは下記から適切なものを選んで編集すると良い。
https://hub.docker.com/r/nvidia/cuda/