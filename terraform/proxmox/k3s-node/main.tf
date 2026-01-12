resource "local_file" "cloud_init_file" {
  content = templatefile("${path.module}/templates/user_data.yaml.tpl", {
    hostname = var.vm_name
  })
  filename = "${path.module}/generated/user_data_${var.vm_name}.yaml"
}

resource "null_resource" "cloud_init_snippet" {
  # 파일 내용이 변경되면 트리거 작동
  triggers = {
    file_content = local_file.cloud_init_file.content
    pve_host     = var.pve_host_address
    pve_user     = var.pve_ssh_user
    pve_key      = var.pve_ssh_private_key_path
    snippet_path = "/var/lib/vz/snippets/user_data_${var.vm_name}.yaml"
  }

  connection {
    type        = "ssh"
    user        = self.triggers.pve_user
    private_key = file(self.triggers.pve_key)
    host        = self.triggers.pve_host
  }

  provisioner "file" {
    source      = local_file.cloud_init_file.filename
    destination = self.triggers.snippet_path
  }

  provisioner "remote-exec" {
    when = destroy
    inline = [
      "rm -f ${self.triggers.snippet_path}",
      "echo 'Deleted snippet: ${self.triggers.snippet_path}'"
    ]
  }
}

resource "proxmox_vm_qemu" "node" {
  depends_on = [null_resource.cloud_init_snippet]

  name        = var.vm_name
  target_node = var.target_node
  vmid        = var.vm_id != 0 ? var.vm_id : null
  clone       = var.template_name
  full_clone  = true

  agent    = 1
  os_type  = "cloud-init"
  cores    = var.cores
  sockets  = 1
  cpu_type = "host"
  memory   = var.memory

  scsihw   = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disk {
    slot     = "scsi0"
    type     = "disk"
    size     = var.disk_size
    storage  = var.storage_pool
    iothread = true
    discard  = true
  }

  disk {
    slot    = "ide2"
    type    = "cloudinit"
    storage = var.storage_pool
  }

  serial {
    id   = 0
    type = "socket"
  }

  network {
    id     = 0
    model  = "virtio"
    bridge = var.vm_network_bridge
  }

  ipconfig0 = var.vm_ip != null ? "ip=${var.vm_ip},gw=${var.vm_gw}" : "ip=dhcp"
  cicustom  = "vendor=${var.snippet_storage_pool}:snippets/user_data_${var.vm_name}.yaml"
  ciuser  = var.vm_user
  
  sshkeys = <<EOF
  ${trimspace(var.vm_ssh_public_key)}
  EOF

  lifecycle {
    # MAC 주소 변경만 무시.
    ignore_changes = [
      network[0].macaddr,
    ]
  }
}