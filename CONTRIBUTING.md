# Contributing to OpenCSP Modules

OpenCSP-modules 프로젝트에 관심을 가져주셔서 감사합니다!

이 프로젝트는 다양한 환경 구성을 지원하기 위해 여러분의 적극적인 기여를 기다리고 있습니다.

기여하기 전에 아래 가이드를 읽어주시면 감사하겠습니다.


## 기여 절차 (Workflow)

1.  **Issue 확인 및 생성**: 작업하려는 내용에 대한 Issue가 있는지 확인하세요. 없다면 새로 생성하여 논의를 시작해 주세요.
2.  **Fork & Clone**: 저장소를 Fork 하고 로컬 환경에 Clone 합니다.
3.  **Branch 생성**: 작업 목적에 맞는 브랜치를 생성합니다.
    * `feat/{issue-number}-add-aws-module`
    * `fix/{issue-number}-ansible-k3s-restart`
4.  **Code 작성**: 코드 스타일 가이드를 준수하여 작업합니다.
5.  **Test**: 가능한 한 로컬 환경에서 테스트를 진행해 주세요.
6.  **Commit & Push**: 의미 있는 커밋 메시지를 작성하고 Push 합니다.
7.  **Pull Request (PR)**: 작업 내용을 상세히 기술하여 PR을 요청합니다.

## 코드 스타일 가이드 (Style Guide)

### Terraform
* **Format**: 모든 코드는 `terraform fmt`를 통과해야 합니다.
* **Documentation**: `README.md`에 모듈의 `Inputs`, `Outputs`, `Dependencies`를 명시해야 합니다. (terraform-docs 사용 권장)
* **Variables**: 변수에는 반드시 `description`과 `type`을 명시해 주세요.

### Ansible
* **Linting**: `ansible-lint`를 사용하여 문법 오류와 모범 사례 위반을 확인해 주세요.
* **Idempotency**: 모든 태스크는 **멱등성(Idempotency)**을 보장해야 합니다. 여러 번 실행해도 결과가 같아야 합니다.
* **Variables**: 역할(Role) 내의 변수는 `defaults/main.yml`에 정의하여 사용자가 오버라이딩 할 수 있도록 해주세요.

## 커밋 메시지 규칙 (Commit Convention)

[Conventional Commits](https://www.conventionalcommits.org/) 규칙을 따르는 것을 권장합니다.

* `feat`: 새로운 기능 (새로운 모듈, 역할 추가)
* `fix`: 버그 수정
* `docs`: 문서 수정
* `style`: 코드 포맷팅, 세미콜론 누락 등 (코드 변경 없음)
* `refactor`: 코드 리팩토링
* `test`: 테스트 코드 추가
* `chore`: 빌드 업무 수정, 패키지 매니저 수정 등

예시: `feat(terraform): add proxmox lxc module`

## 테스트 가이드

이 모듈은 다양한 환경에서 사용되므로 테스트가 중요합니다.
PR을 보낼 때, 본인이 테스트한 환경(예: Proxmox VE 8.1, Ubuntu 24.04)과 결과를 함께 남겨주시면 리뷰에 큰 도움이 됩니다.

## 라이선스 (License)

이 프로젝트에 기여함으로써 귀하는 귀하의 기여 내용을 **Apache License 2.0** 하에 배포하는 것에 동의하는 것으로 간주됩니다.

---

여러분의 소중한 기여가 더 나은 OpenCSP를 만듭니다! 
