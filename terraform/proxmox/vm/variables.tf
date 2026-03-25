# --- Proxmox Host Access (Snippet 관리를 위해 필요) ---
variable "pve_host_address" {
  type        = string
  description = "Proxmox 호스트 IP 또는 도메인 (Snippet 업로드용)"
}

variable "pve_ssh_user" {
  type    = string
  default = "root"
}

variable "pve_ssh_private_key_path" {
  type        = string
  description = "Proxmox 호스트 접속용 SSH Private Key 경로"
}

# --- VM Configuration ---
variable "target_node" {
  type    = string
  default = "pve"
}

variable "template_name" {
  type    = string
  default = "ubuntu-2404-template"
}

variable "vm_name" {
  type    = string
  default = "vm"
}

variable "vm_id" {
  type    = number
  default = 0
}

# --- Network ---
variable "vm_network_bridge" {
  description = "Proxmox 네트워크 브리지 (예: vmbr0, vmbr1)"
  type        = string
  default     = "vmbr0"
}

variable "vm_ip" {
  description = "CIDR 형식의 IP 주소 (예: 192.168.0.100/24). 입력하지 않으면 DHCP 사용"
  type        = string
  default     = null
}

variable "vm_gw" {
  description = "게이트웨이 주소. DHCP 사용 시 무시됨"
  type        = string
  default     = null
}

# --- Resources ---
variable "cores" {
  type    = number
  default = 1
}

variable "memory" {
  type    = number
  default = 1024
}

variable "disk_size" {
  type    = string
  default = "10G"
}

variable "storage_pool" {
  type    = string
  default = "local-lvm"
}

variable "snippet_storage_pool" {
  type    = string
  default = "local"
}

# --- User & Access ---
variable "vm_user" {
  type    = string
  default = "ubuntu"
}

variable "vm_password" {
  description = "VM 기본 사용자(ubuntu)의 초기 비밀번호"
  type        = string
  sensitive   = true
  default     = null
}

variable "vm_ssh_public_key" {
  type = string
}