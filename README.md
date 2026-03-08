# OpenCSP Modules

![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)

**OpenCSP-modules** is a collection of **Terraform modules** and **Ansible Roles** designed to quickly and easily build Kubernetes (K3s) clusters and surrounding systems across various infrastructure environments.

This project provides the core building blocks for **OpenCSP (Open Cloud Service Platform)** and supports flexible configurations ranging from single-node to multi-node clusters.

## Directory Structure

This repository is organized into Terraform modules and Ansible Roles.

```bash
.
├── terraform/          # Reusable Terraform modules
│   ├── proxmox/        # VM/LXC modules for Proxmox environments
│   └── aws/            # (Planned) AWS infrastructure modules
└── ansible/            # Reusable Ansible Roles
    ├── k3s-node/       # K3s installation and node joining
    └── common/         # Base OS configuration (Timezone, Packages, etc.)
```

## Usage

These modules are not intended to be run standalone. They are designed to be called from an external repository for provisioning or similar.

### 1. Terraform Module Example

Use the `git::` source to reference a remote module. It is recommended to pin a specific version using a `ref` tag.

```hcl
module "k3s_cluster" {
  # Reference the terraform/proxmox/vm path in OpenCSP-modules
  source = "git::[https://github.com/h001-lab/OpenCSP-modules.git//terraform/proxmox/vm?ref=main](https://github.com/h001-lab/OpenCSP-modules.git//terraform/proxmox/vm?ref=main)"

  # Pass variables
  vm_name       = "my-k3s-node"
  cores         = 4
  memory        = 8192
  target_node   = "pve-01"
  # ... other required variables
}
```

### 2. Ansible Role Example

Install roles via a `requirements.yml` file and use them in your playbook.

requirements.yml:

``` yaml
collections:
  - name: [https://github.com/h001-lab/OpenCSP-modules.git#/ansible/collection](https://github.com/h001-lab/OpenCSP-modules.git#/ansible/collection)
    type: git
    version: main
```



## Contributing

Contributions from the open source community are welcome! Bug reports, new features, documentation improvements — all forms of contribution are appreciated. See [CONTRIBUTING.md](CONTRIBUTING.md) for details.

## License

This project is distributed under the Apache License 2.0. See the [LICENSE](LICENSE) file for details.
