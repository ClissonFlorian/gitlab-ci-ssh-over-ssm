#!/bin/bash

main() {
  local environment=$1
  cd ansible
  echo "***************************************"
  echo "   Ansible execute for environment $environment"
  echo "***************************************"
  ansible-playbook all.yaml -i environments/"$environment"_aws_ec2.yaml -e "@environments/$environment.yaml"
}

main "$@"
