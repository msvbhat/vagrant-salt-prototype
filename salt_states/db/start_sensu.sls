sensu-client:
  service.running:
  - watch:
    - file: /etc/sensu/conf.d/rabbitmq.json
    - file: /etc/sensu/conf.d/client.json

/etc/sensu/conf.d/client.json:
  file.managed:
    - source: salt://client.json

/etc/sensu/conf.d/rabbitmq.json:
  file.managed:
    - source: salt://rabbitmq.json
