# Only run this on Fedora systems
{% if grains["os"] == "Fedora" %}
/etc/yum.repos.d/fedora-chromium-stable.repo:
  file.managed:
    - source: salt://roles/desktop/files/fedora/fedora-chromium-stable.repo
    - mode: 0644

chromium:
  pkg.latest:
    - refresh: True
    - require:
      - file: /etc/yum.repos.d/fedora-chromium-stable.repo
{% endif %}
