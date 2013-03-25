{% from "macros.sls" import gsettings %}

{% set user = pillar.get("local_user", "") %}

{% if user and grains["os"] == "Fedora"  %}
# Make the default button layout a lot less stupid
{{ gsettings(user, "org.gnome.shell.overrides", "button-layout", ':minimize,maximize,close', "':minimize,maximize,close'") }}

# Make gedit a bit more fanciful
{{ gsettings(user, "org.gnome.gedit.plugins.filebrowser", "enable-remote", true, '^true$') }}
{{ gsettings(user, "org.gnome.gedit.preferences.editor", "auto-save", true, '^true$') }}
{{ gsettings(user, "org.gnome.gedit.preferences.editor", "bracket-matching", true, '^true$') }}
{{ gsettings(user, "org.gnome.gedit.preferences.editor", "display-line-numbers", true, '^true$') }}
{{ gsettings(user, "org.gnome.gedit.preferences.editor", "highlight-current-line", true, '^true$') }}


{{ gsettings(user, "org.gnome.shell", "always-show-log-out", true, '^true$') }}

# Nautilus desktop settings
{{ gsettings(user, "org.gnome.nautilus.desktop", "background-fade", true, '^true$') }}
{{ gsettings(user, "org.gnome.nautilus.desktop", "network-icon-visible", true, '^true$') }}
{{ gsettings(user, "org.gnome.nautilus.preferences", "sort-directories-first", true, '^true$') }}
{% endif %}
