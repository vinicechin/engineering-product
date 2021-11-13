#!/bin/bash

echo "Download and install gitlab-runner"
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | sudo bash
sudo apt-get install gitlab-runner

echo "Install JQ"
sudo apt-get install -y jq

echo "Get Token"
gitlab_runner_token_string=$(curl --header "PRIVATE-TOKEN: ypCa3Dzb23o5nvsixwPP" "http://192.168.33.9/gitlab/api/v4/projects/2" | jq .runners_token)
# echo ${gitlab_runner_token_string}
gitlab_runner_token="${gitlab_runner_token_string%\"}"
gitlab_runner_token="${gitlab_runner_token#\"}"
echo "$gitlab_runner_token"

echo "Register gitlab-runner for deployment"
sudo gitlab-runner register --url "http://192.168.33.9/gitlab/" --registration-token ${gitlab_runner_token} --executor shell --description "shell" --tag-list "staging-vm-engineering-shell" --run-untagged="true" --non-interactive

echo "Restart gitlab-runner"
sudo gitlab-runner restart

echo "Add sudo permission to gitlab-runner"
sudo usermod -a -G sudo gitlab-runner
sudo echo "gitlab-runner ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
 
echo "Done."
