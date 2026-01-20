# OpenCSP Modules

![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)

**OpenCSP-modules**는 다양한 인프라 환경에서 Kubernetes(K3s) 클러스터와 주변 시스템을 쉽고 빠르게 구축하기 위해 설계된 **Terraform 모듈**과 **Ansible Role**의 모음집입니다.

이 프로젝트는 **OpenCSP(Open Cloud Service Platform)** 구축을 위한 핵심 빌딩 블록을 제공하며, 단일 노드부터 멀티 노드 클러스터까지 유연한 구성을 지원합니다.

## Directory Structure

이 저장소는 크게 Terraform 모듈과 Ansible Role로 나뉩니다.

```bash
.
├── terraform/          # 재사용 가능한 Terraform 모듈
│   ├── proxmox/        # Proxmox 환경용 VM/LXC 모듈
│   └── aws/            # (Planned) AWS 인프라 모듈
└── ansible/            # 재사용 가능한 Ansible Roles
    ├── k3s-node/       # K3s 설치 및 노드 조인
    └── common/         # OS 기본 설정 (Timezone, Packages 등)
```

## Usage

이 모듈들은 독립적으로 실행되는 것이 아니라, 사용자의 **Ops 레포지토리(Provisioning Repo)** 에서 호출하여 사용하도록 설계되었습니다. 

### 1. Terraform Module 사용 예시

git:: 소스를 사용하여 원격 모듈을 불러옵니다. ref 태그를 사용하여 특정 버전을 고정하는 것을 권장합니다.

```hcl
module "k3s_cluster" {
  # OpenCSP-modules의 terraform/proxmox/vm 경로 참조
  source = "git::[https://github.com/h001-lab/OpenCSP-modules.git//terraform/proxmox/vm?ref=main](https://github.com/h001-lab/OpenCSP-modules.git//terraform/proxmox/vm?ref=main)"

  # 변수 전달
  vm_name       = "my-k3s-node"
  cores         = 4
  memory        = 8192
  target_node   = "pve-01"
  # ... 기타 필수 변수
}
```

### 2. Ansible Role 사용 예시

requirements.yml 파일을 통해 역할을 설치하고 플레이북에서 사용합니다.

requirements.yml:

``` yaml
collections:
  - name: [https://github.com/h001-lab/OpenCSP-modules.git#/ansible/collection](https://github.com/h001-lab/OpenCSP-modules.git#/ansible/collection)
    type: git
    version: main
```



## Contributing

이 프로젝트는 오픈소스 커뮤니티의 기여를 환영합니다! 버그 제보, 기능 추가, 문서 수정 등 어떤 형태의 기여도 감사합니다. 자세한 내용은 [CONTRIBUTING.md](CONTRIBUTING.md) 파일을 확인하세요.

## License

이 프로젝트는 Apache License 2.0 하에 배포됩니다. 자세한 내용은 [LICENSE](LICENSE) 파일을 확인하세요.

