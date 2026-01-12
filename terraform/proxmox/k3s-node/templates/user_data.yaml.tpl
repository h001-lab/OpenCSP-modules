hostname: ${hostname}
package_update: true
package_upgrade: true

packages:
  - qemu-guest-agent
  - python3
  - curl
  - wget
  - gnupg

runcmd:
  # Agent 실행 및 부팅 시 자동 시작 설정
  - systemctl enable --now qemu-guest-agent

  # Serial Console 로그 활성화 (Proxmox xterm.js 사용 및 디버깅용)
  - sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="/&console=ttyS0,115200n8 /' /etc/default/grub
  - update-grub