#!/bin/bash

sudo apt-get update -y && sudo apt-get install \
    ansible -y

git clone https://github.com/devbox-hero/ansible-roles.git

cd ansible-roles/

cat > config.cfg << EOL
---
user: andrei
password: password
authorized_key : ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDc6xX5kZ9bZKsf2RmeBgwomiareOpEDLx6zwGCGcHQ34UFNi8czg3ZGoziTjO4ZRA4j1cGhyd7S57renRw6xKI8GV1STlVvQmDUhLr11FJLvn8qd5tNnbNV6SemZ+na0Bq7Klz46HmK9LJ6E9Vq3n/vaP8f7SxroQF/SIzSV9Kvtqy4U3zOrvzffb2HHyNxiK87b1vqewUCsAVhADAdSHuOCY04+9H0AVgLEK+2fWvbuLCrAsggpTjSaVnSZpqJWQWZkASiCNs7sUzSeBWbyR0vaMH5010/nfv8cHRgE96Es+bwW/eCdC5qbRx2pubFPkWFHBMNE/eI+2jAUhpMuoHJ41eww78Oq0TeF6AGAYB9vk5LxUILzYQqv+53tCDLHXo7/PRpX16Q293gytQTITIk0Qw9PDmoHDyaWAP+Lxtph1U6OtGl1fr+aHx/AN1H53lU0KXqpfk0hjd/y67sST7/bDUVQS0Ipzxc4+4ProXe0OfDH/6vaqPW1T6ELcRSZs8q62u1Wp/s+qHXfPfDvjc/edI07GoHHpEZZ225jydnKGZ+Ru3eh7dBBjUWQcqaftp73D2xpnaiA27JhuAqETGMArDx4b/TQ9nCUdiicBSe3YisoYi1BUJerNcAKbfaOwCxSr1lR/aDnRvC8vM3hkl2c4uirmjp3JE0/geuUwBrw== andrei@housemeerkat.com

users:
  - "{{ user }}"

provider: local

unattended_reboot:
  enabled: false
  time: 06:00
EOL

ansible-playbook main.yml