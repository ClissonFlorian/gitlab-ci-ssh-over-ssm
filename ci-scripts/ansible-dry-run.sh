#!/bin/bash

main() {
  local environment=$1
  cd ansible
  echo "***************************************"
  echo "   Compute dynamic inventory"
  echo "***************************************"
  ansible-inventory -i environments/"$environment"_aws_ec2.yaml --graph

  echo "***************************************"
  echo "   Ansible dry run"
  echo "***************************************"
  ansible-playbook all.yaml -i environments/"$environment"_aws_ec2.yaml -e "@environments/$environment.yaml" --check --diff
}

main "$@"
