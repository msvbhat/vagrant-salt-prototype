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

sensu_load:
  cmd.run:
   - name: sensu-install -p load-checks

sensu_memory:
  cmd.run:
   - name: sensu-install -p memory-checks

sensu_disk:
  cmd.run:
   - name: sensu-install -p disk-checks

sensu_cpu:
  cmd.run:
   - name: sensu-install -p cpu-checks
