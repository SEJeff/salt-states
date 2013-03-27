dnsmasq:
  pkg.installed

dnsmasq_service:
  service.running:
    - name: dnsmasq
    - enable: True
  require:
    - pkg.installed: dnsmasq
