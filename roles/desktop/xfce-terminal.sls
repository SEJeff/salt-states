# Sets up the xfce terminal, one I find more pleasant because it is more
# configurable. In gnome-terminal (for instance) it is actually impossible
# to bind a keyboard shortcut to the action for changing window titles.
{% from "macros.sls" import gsettings %}
{% set username = pillar.get("local_user", "") %}

{% if grains["os"] == "Fedora" %}
  {% set xfce_terminal = "Terminal" %}
{% elif grains["os_family"] == "Debian" %}
  {% set xfce_terminal = "xfce4-terminal" %}
{% endif %}

# Install the right xfce terminal package
{{ xfce_terminal }}:
  pkg.installed

# Only execute any of the below if the "local_user" pillar key exists
{% if username %}
{{ salt["user.info"](username)["home"] }}/.config/Terminal/terminalrc:
  file.managed:
    - mode: 664
    # Don't overwrite an existing file if it has been customized
    - replace: False
    - makedirs: True
    - user: {{ username }}
    - source: salt://desktop/files/terminalrc
    # Overly fancy way to get the primary group of pillar["local_user"]
    #     Runs equiv of: `salt-call user.info $value_of_pillar_local_user`
    - group: {{ salt["user.info"](username)["groups"][0] }}
    - require:
      - pkg: {{ xfce_terminal }}

# When the new terminal is installed, set it as the default for GNOME 3
{{ gsettings(username, "org.gnome.desktop.default-applications.terminal", "exec", "Terminal", "'Terminal'") }}
    - require:
      - pkg: {{ xfce_terminal }}
{% endif %}
