sensu-server:
  service.running:
  - watch:
    - file: /etc/sensu/conf.d/redis.json
    - file: /etc/sensu/conf.d/rabbitmq.json
    - file: /etc/sensu/conf.d/api.json
    - file: /etc/sensu/conf.d/client.json
    - file: /etc/sensu/conf.d/check-load.json
    - file: /etc/sensu/conf.d/check-memory.json
    - file: /etc/sensu/conf.d/check-disk.json
    - file: /etc/sensu/conf.d/check-cpu.json
    - file: /etc/sensu/conf.d/check-mysql.json
    - file: /etc/sensu/conf.d/check-webapp.json

sensu-api:
  service.running:
  - watch:
    - file: /etc/sensu/conf.d/redis.json
    - file: /etc/sensu/conf.d/rabbitmq.json
    - file: /etc/sensu/conf.d/api.json
    - file: /etc/sensu/conf.d/client.json
    - file: /etc/sensu/conf.d/check-load.json
    - file: /etc/sensu/conf.d/check-memory.json
    - file: /etc/sensu/conf.d/check-disk.json
    - file: /etc/sensu/conf.d/check-cpu.json
    - file: /etc/sensu/conf.d/check-mysql.json
    - file: /etc/sensu/conf.d/check-webapp.json

sensu-client:
  service.running:
  - watch:
    - file: /etc/sensu/conf.d/rabbitmq.json
    - file: /etc/sensu/conf.d/client.json
    - file: /etc/sensu/conf.d/check-load.json
    - file: /etc/sensu/conf.d/check-memory.json
    - file: /etc/sensu/conf.d/check-disk.json
    - file: /etc/sensu/conf.d/check-cpu.json

uchiwa_start:
  service.running:
    - name: uchiwa
    - watch:
      - file: /etc/sensu/uchiwa.json
      - service: sensu-server
      - service: sensu-api

/etc/sensu/conf.d/redis.json:
  file.managed:
    - source: salt://redis.json

/etc/sensu/conf.d/api.json:
  file.managed:
    - source: salt://api.json

/etc/sensu/conf.d/client.json:
  file.managed:
    - source: salt://client.json

/etc/sensu/conf.d/rabbitmq.json:
  file.managed:
    - source: salt://rabbitmq.json

/etc/sensu/uchiwa.json:
  file.managed:
    - source: salt://uchiwa.json

/etc/sensu/conf.d/check-load.json:
  file.managed:
    - source: salt://check-load.json

/etc/sensu/conf.d/check-memory.json:
  file.managed:
    - source: salt://check-memory.json

/etc/sensu/conf.d/check-disk.json:
  file.managed:
    - source: salt://check-disk.json

/etc/sensu/conf.d/check-cpu.json:
  file.managed:
    - source: salt://check-cpu.json

/etc/sensu/conf.d/check-mysql.json:
  file.managed:
    - source: salt://check-mysql.json

/etc/sensu/conf.d/check-webapp.json:
  file.managed:
    - source: salt://check-webapp.json
