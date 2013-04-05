adobe-flash-repo:
  pkg.installed:
    - sources:
{%- if grains['cpuarch'] == 'x86_64' and grains['os_family'] == 'RedHat' %}
      - adobe-release-x86_64: http://linuxdownload.adobe.com/adobe-release/adobe-release-x86_64-1.0-1.noarch.rpm
{%- elif grains['os_family'] == 'RedHat' %}
      - adobe-release-i386: http://linuxdownload.adobe.com/adobe-release/adobe-release-i386-1.0-1.noarch.rpm
{% endif %}

flash-plugin:
  pkg.installed:
    - fromrepo: adobe-linux-x86_64
