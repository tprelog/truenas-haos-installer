#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="truenas-haos-installer"
iso_label="HAOS_INSTALLER_$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m)"
iso_publisher="tprelog <https://github.com>"
iso_application="HAOS Installation ISO for a TrueNAS VM"
iso_version="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y.%m.%d)-mini"
install_dir="arch"
bootmodes=('uefi-x64.systemd-boot.esp'
           'uefi-x64.systemd-boot.eltorito')
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86,arm64' '-b' '1M' '-Xdict-size' '1M')
bootstrap_tarball_compression=('zstd' '-c' '-T0' '--auto-threads=logical' '--long' '-19')
kernel_params_x86_64="cow_spacesize=1G script=/usr/local/bin/install-haos"
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/usr/local/bin/install-haos"]="0:0:755"
)
