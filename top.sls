# The top file sets the default states that apply to a salt minion
# when "state.highstate" is run.

base:
  '*':
    - roles.default
    - services.salt

  # pcre matches minion ids
  '(omniscience|chit-jsl1070|desktopmonster)':
    - match: pcre
    - services.salt.master

  # Use a regex on the productname grain to match some workstations
  # I use. This is the equiv of: `dmidecode -s system-product-name`
  'productname:.*(700Z[35]C|OptiPlex|Latitude|Precision).*':
    - match: grain_pcre
    - roles.desktop

  # The motherboard manufacturer doesn't include valid dmi info
  'desktopmonster':
    - roles.desktop
