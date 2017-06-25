redis-server:
  pkg.installed

update_apt:
  cmd.wait:
   - name: apt-get update

import_key:
  cmd.wait:
    - name: curl https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | sudo apt-key add -
    - watch_in:
      - cmd: update_apt

rabbitmq_repo:
  pkgrepo.managed:
    - humanname: RabbitMQ PPA
    - name: deb http://www.rabbitmq.com/debian/ testing main
    - file: /etc/apt/sources.list.d/rabbitmq.list
    - refresh_db: False
    - watch_in:
      - cmd: import_key

erlang-nox:
  pkg.installed

rabbitmq-server:
  pkg.installed:
    - require:
      - pkgrepo: deb http://www.rabbitmq.com/debian/ testing main
      - pkg: erlang-nox

add_vhost:
  cmd.run:
    - name: rabbitmqctl add_vhost /sensu

add_user:
  cmd.run:
    - name: rabbitmqctl add_user sensu secret

set_perms:
  cmd.run:
    - name: rabbitmqctl set_permissions -p /sensu sensu ".*" ".*" ".*"

