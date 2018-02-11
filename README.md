# xrosfs-bench

[xrosfs](https://github.com/hankei6km/xrosfs) の[ベンチテスト](https://github.com/hankei6km/xrosfs/blob/master/bench_test/README_ja.md)から利用される 
Docker コンテナのイメージ.


## ファイルの配置とチェック

イメージのビルド時(Docker HUB上でのビルドを想定しているので、実際には GitHUB 上のリポジトリへ push する時)には、各バリアントの `Dockerfile` が格納されているディレクトリ
(ie. `<version>/alpine/bench/`)
の下に、セットアップ用スクリプトのディレクトリ(`<verson>/setup-scripts`)
が配置(コピー)されている必要がある


これについては
`<version>/sync-files.sh` と
`<version>/test-files-synced.sh` で配置とチェックができるようになっている.

例)

```
$ vim 0.1.0/setup-scripts/setup-bench-basic-data.sh
$ sh 0.1.0/sync-files.sh
$ sh 0.1.0/test-files-synced.sh
```


## ローカルでのビルド

ローカルでイメージをビルドする場合は、`build-bench-img.sh` で実行できる.  

例)

```
# ./build-bench-img.sh xrosfs-bench 0.1.0/stretch-slim/
```

なお、このスクリプトを実行するとセットアップスクリプトが各バリアントにコピーされるため、
編集中のファイルがある場合は注意が必要となる.


## License

Copyright (c) 2018 hankei6km

Licensed under the MIT License. See LICENSE.txt in the project root.
