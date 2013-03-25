# Set up gnome-terminal how I like it

# If the "local_user" pillar key isn't set, don't blow up
{% set user = pillar.get("local_user", "") %}

# Runs the equivalent of: `which gconftool-2`.
{% set gconf = salt["cmd.which"]("gconftool-2") %}
{% set base_path = "/apps/gnome-terminal/profiles/Default" %}

# Only run if gconftool-2 and gnome-terminal are available and a pillar
# "local_user" has been defined. If it hasn't do nothing and don't blow up
{% if gconf and user and salt["cmd.which"]("gnome-terminal") %}

# Ignore the default theme colors
{{ gconf }} --type bool --set {{ base_path }}/use_theme_colors false:
  cmd.run:
    - user: {{ user }}
    - name: {{ gconf }} --type bool --set {{ base_path }}/use_theme_colors false
    - unless: {{ gconf }} --get {{ base_path }}/use_theme_colors | grep -q '^false$'

# Foreground text green
{{ gconf }} --type str  --set {{ base_path }}/foreground_color '#0000FFFF0000':
  cmd.run:
    - user: {{ user }}
    - unless: {{ gconf }} --get {{ base_path }}/foreground_color | grep -q '^#0000FFFF0000$'

# Background black
{{ gconf }} --type str  --set {{ base_path }}/background_color '#000000000000':
  cmd.run:
    - user: {{ user }}
    - unless: {{ gconf }} --get {{ base_path }}/background_color | grep -q '^#000000000000$'

# Scrollback lines to 10k
{{ gconf }} --type int  --set {{ base_path }}/scrollback_lines 10000:
  cmd.run:
    - user: {{ user }}
    - unless: {{ gconf }} --get {{ base_path }}/scrollback_lines | grep -q '^10000$'
{% endif %}
