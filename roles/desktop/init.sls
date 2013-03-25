include:
  - roles.desktop.gnome-terminal
  - roles.desktop.xfce-terminal
{% if grains["os"] == "Fedora" %}
  - roles.desktop.chrome
  # GNOME 3 configuration
  - roles.desktop.gnome-settings
{% endif %}
