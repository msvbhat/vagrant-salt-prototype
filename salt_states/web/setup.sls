{% set go_path = salt['cmd.run']('echo $HOME') %}
{% set mhost = '192.168.42.5' %}
{% set muser = 'webapp' %}
{% set mpasswd = 'p4ssw0rd' %}

setup_mysql:
  cmd.run:
    - name: mysql -h {{ mhost }} -u{{ muser }} -p{{ mpasswd }} < {{ go_path }}/go/src/github.com/josephspurrier/gowebapp/config/mysql.sql

setup_backend:
  file.managed:
    - name: {{ go_path }}/go/src/github.com/josephspurrier/gowebapp/config/config.json
    - source: salt://config.json
