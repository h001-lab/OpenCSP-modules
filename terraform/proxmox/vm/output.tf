output "vm_name" {
  value = proxmox_vm_qemu.node.name
}

output "vm_ip" {
  description = "VM IP (QEMU Agent가 실행된 후 확인 가능)"
  value       = proxmox_vm_qemu.node.default_ipv4_address
}

output "ssh_public_key" {
  description = "VM에 등록된 SSH Public Key (외부 주입 또는 자동 생성)"
  value       = local.ssh_public_key
}

output "ssh_private_key" {
  description = "VM 접속용 SSH Private Key (자동 생성한 경우에만 유효, PEM 형식)"
  value       = var.vm_ssh_public_key == null ? tls_private_key.vm_key.private_key_openssh : null
  sensitive   = false
}