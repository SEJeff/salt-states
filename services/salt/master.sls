# Install the salt master, make sure it is started, and starts on boot
salt-master:
  pkg:
    - installed
  service.running:
    - enable: True
    # Restart salt-master when /etc/salt/master changes
    - watch:
      - file: /etc/salt/master

/etc/salt/master:
  file.managed:
    - mode: 644
    - backup: True
    - source: salt://services/salt/files/master
    # Don't put this file down until salt-minion has been installed
    - require:
      - pkg: salt-master
