mysql-client-5.6:
  pkg.installed

git:
  pkg.installed

install_go:
  archive.extracted:
    - name: /usr/local
    - source: https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz
    - source_hash: 1862f4c3d3907e59b04a757cfda0ea7aa9ef39274af99a784f5be843c80c6772

go_get_webapp:
  cmd.run:
    - name: /usr/local/go/bin/go get github.com/josephspurrier/gowebapp

build_go:
  cmd.run:
    - name: cd $HOME/go/src/github.com/josephspurrier/gowebapp && /usr/local/go/bin/go build
