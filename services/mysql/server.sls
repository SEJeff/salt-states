include:
  - services.mysql

mysql-server:
  pkg.installed

mysqld:
  service.running:
    - enable: True
    - require:
      - pkg.installed: mysql-server
