# Ansible Jenkins-Swarm-Slave Driver
This image is intended to be used to configure remote hosts as Jenkins-Swarm-Slaves using Ansible in Docker.

## System Requirements

+ Docker
+ SSH credentials established on target machine

## Bash Usage
The following shows an example image build, container run, and Ansible execution which does a simple `ping` command:

```
# docker build -t ansible-jenkins-swarm-slave-driver .
Sending build context to Docker daemon 146.9 kB
Step 1 : FROM ansible/ubuntu14.04-ansible
 ---> 4621d4fe2959
Step 2 : ENV ANSIBLE_HOST_KEY_CHECKING False
 ---> Using cache
 ---> 68f282e8db60
Step 3 : RUN apt-get install -y sshpass 	&& apt-get clean 	&& rm -rf /var/lib/apt/lists/* 	&& rm -rf /tmp/*
 ---> Using cache
 ---> b1da5a169ed9
Successfully built b1da5a169ed9
root@ff0d2da7190d:~/github/psharkey/ansible-jenkins_swarm_client# docker run --rm -it -w=$(pwd) --volumes-from github ansible-jenkins-swarm-slave-driver bash
root@ff6c0cf2c1e3:~/github/psharkey/ansible-jenkins_swarm_client# ansible target -i hosts -m ping --ask-pass -u psharkey
SSH password:
10.10.101.113 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
root@ff6c0cf2c1e3:~/github/psharkey/ansible-jenkins_swarm_client# ansible target -i hosts -m ping --ask-pass -u psharkey
SSH password:
10.10.101.113 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
root@ff6c0cf2c1e3:~/github/psharkey/ansible-jenkins_swarm_client# ansible target -i hosts -m ping --ask-pass -u psharkey
SSH password:
10.10.101.113 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
root@ff6c0cf2c1e3:~/github/psharkey/ansible-jenkins_swarm_client#
```

## Ansible Example
The bash step in the previous example may be eliminated so Ansible can be executed directly via the `docker run` command:

```bash
root@ff0d2da7190d:~/github/psharkey/ansible-jenkins_swarm_client# docker run --rm -it -w=$(pwd) --volumes-from github ansible-jenkins-swarm-slave-driver ansible target -i hosts -m ping --ask-pass -u psharkey
SSH password:
10.10.101.113 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
root@ff0d2da7190d:~/github/psharkey/ansible-jenkins_swarm_client#
```

## Playbook Example

The following shows a simple playbook (nginx.yml) example which installs NGINX on the remote server:

```bash
root@ff0d2da7190d:~/github/psharkey/ansible-jenkins_swarm_client# docker run --rm -it -w=$(pwd) --volumes-from github ansible-jenkins-swarm-slave-driver ansible-playbook -i hosts --ask-pass --ask-sudo-pass -u psharkey -s nginx.yml
SSH password:
SUDO password[defaults to SSH password]:

PLAY ***************************************************************************

TASK [setup] *******************************************************************
ok: [10.10.101.113]

TASK [Install Nginx] ***********************************************************
changed: [10.10.101.113]

PLAY RECAP *********************************************************************
10.10.101.113              : ok=2    changed=1    unreachable=0    failed=0

root@ff0d2da7190d:~/github/psharkey/ansible-jenkins_swarm_client#
```
