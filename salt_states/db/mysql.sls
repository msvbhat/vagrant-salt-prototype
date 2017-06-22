mysql-server:
  pkg:
    - installed
    - pkgs:
      - mysql-server-5.6
      - python-mysqldb
  service:
    - running
    - name: mysql
    - enable: True
    - require:
      - pkg: mysql-server
  mysql_user:
    - present
    - name: webapp
    - password: p4ssw0rd
    - require:
      - service: mysql
