## Description
(Summarize the changes included in this PR. Link any related issues if applicable.)
`Closes # (issue number)`

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update
- [ ] Refactoring

## Breaking Changes (if applicable)
### Removed
- (e.g. `var.pve_ssh_user` — no longer needed)

### Added
- (e.g. `var.proxmox_api_url` — required for API upload)

### Changed
- (e.g. `var.node_count` → `var.replica_count`)

### Migration Steps
1. (e.g. Pin existing infrastructure to `ref=v0.1.0`)
2. (e.g. Update variable names in your tfvars)
3. (e.g. Run `terraform plan` to verify no destructive changes)
4. (e.g. Switch back to `ref=main`)

## How Has This Been Tested?
(Describe how you tested these changes, including the environment and results. For infrastructure code, actual deployment testing is important.)
* **Test Environment**: (e.g. Proxmox VE 8.1 / Ubuntu 24.04 VM)
* **Test Result**: (e.g. Terraform plan/apply succeeded, K3s node joined successfully)

## Checklist
- [ ] My code follows the project's style guide (`terraform fmt`, `ansible-lint`)
- [ ] I have updated documentation for the changes made (README, variable descriptions, etc.)
- [ ] All tests pass locally
- [ ] Breaking changes are documented above with migration steps
- [ ] Labels are applied (`terraform`, `ansible`, `breaking-change`, `bug`)