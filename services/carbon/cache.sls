# Install the salt master, make sure it is started, and starts on boot
python-carbon:
  pkg:
    - installed
  service.running:
    - enable: True
    - name: carbon-cache
    # Use the native /etc/init.d/carbon-cache
    # init script instead of systemctl
    - provider: service
    - watch:
    # Restart the carbon cache when this changes
      - file: /etc/carbon/carbon.conf

/etc/carbon/carbon.conf:
  file.managed:
    - mode: 644
    - backup: True
    - source: salt://services/carbon/files/carbon.conf
    # Don't put this file down until python-carbon has been installed
    - require:
      - pkg: python-carbon
