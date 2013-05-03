# TODO: install and configure collectd to point at graphite if the pillar data exists
collectd-pkgs:
  pkg.installed:
    - names:
      - collectd
      - collectd-apache
      - collectd-ping
      - collectd-snmp
