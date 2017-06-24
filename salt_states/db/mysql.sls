mysql-server-5.6:
  pkg.installed

python-mysqldb:
  pkg.installed

mysql:
  service.running:
    - enable: True
    - watch:
      - pkg: mysql-server-5.6
      - pkg: python-mysqldb
      - file: /etc/mysql/my.cnf
  mysql_user.present:
    - name: webapp
    - host: '%'
    - password: p4ssw0rd
    - require:
      - service: mysql
  mysql_grants.present:
    - user: webapp
    - host: '%'
    - database: '*.*'
    - grant: all privileges

/etc/mysql/my.cnf:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://my.cnf 
    - require:
      - pkg: mysql-server-5.6
