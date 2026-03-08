# Contributing to OpenCSP Modules

Thank you for your interest in the OpenCSP-modules project!

This project welcomes active contributions to support a wide range of infrastructure configurations.

Please read the guidelines below before contributing.


## Workflow

1. **Check or Create an Issue**: See if an issue already exists for what you want to work on. If not, create one to start a discussion.
2. **Fork & Clone**: Fork the repository and clone it to your local environment.
3. **Create a Branch**: Create a branch that reflects the purpose of your work.
    * `feat/{issue-number}-add-aws-module`
    * `fix/{issue-number}-ansible-k3s-restart`
4. **Write Code**: Follow the code style guide when making changes.
5. **Test**: Test your changes in a local environment whenever possible.
6. **Commit & Push**: Write meaningful commit messages and push your branch.
7. **Pull Request (PR)**: Open a PR with a detailed description of your changes.

## Code Style Guide

### Terraform
* **Format**: All code must pass `terraform fmt`.
* **Documentation**: `README.md` must document the module's `Inputs`, `Outputs`, and `Dependencies`. (terraform-docs is recommended)
* **Variables**: All variables must include a `description` and `type`.

### Ansible
* **Linting**: Use `ansible-lint` to check for syntax errors and best practice violations.
* **Idempotency**: All tasks must be **idempotent** — running them multiple times should produce the same result.
* **Variables**: Define role variables in `defaults/main.yml` so users can override them.

## Commit Convention

Following [Conventional Commits](https://www.conventionalcommits.org/) is recommended.

* `feat`: A new feature (new module or role)
* `fix`: A bug fix
* `docs`: Documentation changes
* `style`: Code formatting, missing semicolons, etc. (no logic changes)
* `refactor`: Code refactoring
* `test`: Adding test code
* `chore`: Build process or package manager updates

Example: `feat(terraform): add proxmox lxc module`

## Testing Guide

These modules are used across diverse environments, so testing is important.
When submitting a PR, please include the environment you tested in (e.g., Proxmox VE 8.1, Ubuntu 24.04) and the results — this greatly helps the review process.

## License

By contributing to this project, you agree that your contributions will be licensed under the **Apache License 2.0**.

---

Your contributions make OpenCSP better for everyone!
