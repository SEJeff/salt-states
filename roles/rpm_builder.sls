# TODO: Automatically run mock init -r ${CURRENT_DISTRO}_${CURRENT_ARCH}
rpm_build_packages:
  pkg.installed:
    - names:
      - mock
      - rpm-build
