sensu_repo:
  pkgrepo.managed:
    - humanname: Sensu PPA
    - name: deb     https://sensu.global.ssl.fastly.net/apt trusty main
    - file: /etc/apt/sources.list.d/sensu.list
    - key_url: https://sensu.global.ssl.fastly.net/apt/pubkey.gpg
    - refresh_db: False

sensu_pkgs:
  pkg.installed:
    - pkgs:
      - sensu
      - uchiwa
