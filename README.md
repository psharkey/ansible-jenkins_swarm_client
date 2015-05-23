jenkins_swarm_client
====================

Installs and configures Jenkins swarm client

Requirements
------------

This role requires Ansible 1.4 or higher.

Role Variables
--------------

| Name                                          | Default                         | Description                                                                                                                                                                        |
|-----------------------------------------------|---------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| jenkins_swarm_client_version                  | 1.24                            | Version of Jenkins swarm client to install                                                                                                                                         |
| jenkins_swarm_client_auto_discovery_address   | 255.255.255.255                 | Use this address for udp-based auto-discovery                                                                                                                                      |
| jenkins_swarm_client_description              | ''                              | Description to be put on the slave                                                                                                                                                 |
| jenkins_swarm_client_disable_ssl_verification | false                           | Disable SSL verification in the HttpClient                                                                                                                                         |
| jenkins_swarm_client_executors                | "{{ ansible_processor_cores }}" | Number of executors                                                                                                                                                                |
| jenkins_swarm_client_fsroot                   | /tmp/jenkins                    | Directory where Jenkins places files                                                                                                                                               |
| jenkins_swarm_client_master                   | ''                              | The complete target Jenkins URL. If this option is specified, auto-discovery will be skipped                                                                                       |
| jenkins_swarm_client_password                 | ''                              | The Jenkins user password                                                                                                                                                          |
| jenkins_swarm_client_labels                   | []                              | List of labels to be assigned for this slave.                                                                                                                                      |
| jenkins_swarm_client_mode                     | 'normal'                        | The mode controlling how Jenkins allocates jobs to slaves. Can be either 'normal' (utilize this slave as much as possible) or 'exclusive' (leave this machine for tied jobs only). |
| jenkins_swarm_client_name                     | "{{ ansible_hostname }}"        | Name of the slave                                                                                                                                                                  |
| jenkins_swarm_client_tool_locations           | []                              | List of tool locations to be defined on this slave. A tool location is specified as 'toolName:location'                                                                            |
| jenkins_swarm_client_username                 | ''                              | The Jenkins username for authentication                                                                                                                                            |

Dependencies
------------

- kbrebanov.java (OpenJDK 7)

Example Playbook
----------------

Install Jenkins swarm client
```
- hosts: all
  roles:
    - { role: kbrebanov.jenkins_swarm_client }
```

Install Jenkins swarm client and specify master server
```
- hosts: all
  roles:
    - { role: kbrebanov.jenkins_swarm_client, jenkins_swarm_client_master: 'http://jenkins:8080/' }
```

License
-------

BSD

Author Information
------------------

Kevin Brebanov
