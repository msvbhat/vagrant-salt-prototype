mysql-server:
  pkg.installed
    - pkgs:
      - mysql-server-5.6
      - python-mysqldb
  service.running
    - name: mysql
    - enable: True
    - require:
      - pkg: mysql-server
