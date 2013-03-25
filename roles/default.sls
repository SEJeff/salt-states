{% if grains["os"] == "Fedora" %}
    {% set vim = "vim-enhanced" %}
{% elif grains["os_family"] == "Debian" %}
# Ubuntu defaults to vim-tiny
    {% set vim = "vim-full" %}
{% endif %}

# noop if a suitable vim package isn't defined
# TODO: Write a log state that warns if this happens
{% if vim %}
{{ vim }}:
  pkg.installed

/etc/profile.d/099_editor.sh:
  file.managed:
    - source: salt://roles/files/099_editor.sh
    - user: root
    - group: root
    - mode: 0755
    - require:
      - pkg: {{ vim }}
{% endif %}
