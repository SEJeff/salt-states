# Install the salt minion, make sure it is started, and starts on boot
salt-minion:
  pkg:
    - installed
  service.running:
    - enable: True
    # Restart salt-minion when /etc/salt/minion changes
    - watch:
      - file: /etc/salt/minion

/etc/salt/minion:
  file.managed:
    - mode: 644
    - backup: True
    - source: salt://services/salt/files/minion
    # Don't put this file down until salt-minion has been installed
    - require:
      - pkg: salt-minion
