output "vm_name" {
  value = proxmox_vm_qemu.node.name
}

output "vm_ip" {
  description = "VM IP (QEMU Agent가 실행된 후 확인 가능)"
  value       = proxmox_vm_qemu.node.default_ipv4_address
}