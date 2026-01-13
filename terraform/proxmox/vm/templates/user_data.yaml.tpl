#cloud-config
hostname: ${hostname}
package_update: true
package_upgrade: true

users:
  - default
  - name: ${vm_user}
    groups: sudo
    shell: /bin/bash
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    ssh_authorized_keys:
      - ${vm_ssh_public_key}
%{ if vm_password != null ~}
    lock_passwd: false
%{ endif ~}

%{ if vm_password != null ~}
chpasswd:
  list: |
    ${vm_user}:${vm_password}
  expire: False
%{ endif ~}

ssh_pwauth: False

packages:
  - qemu-guest-agent
  - python3
  - curl
  - wget
  - gnupg

runcmd:
  - systemctl enable --now qemu-guest-agent
  - sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="/&console=ttyS0,115200n8 /' /etc/default/grub
  - update-grub