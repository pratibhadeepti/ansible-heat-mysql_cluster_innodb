# Ansible Heat MySQL

# Description
Ansible playbook that launches a Heat Stack for MySQL and then
configures said stack via ansible.

# Requirements
Ansible >= 2.4
python-openstackclient
shade

# Assumptions

## Heat Stack
The play assumes that the network that the nodes will be provisioned on and the security group  
assigned to the nodes already exist; valid names/IDs must be assigned to these parameters.

# Pre Execution Check-list
- [ ] Ensure the projects quota has enough head room for provisioning the nodes.
- [ ] Set Variables
- [ ] Configure remote-user "stack_launch.yaml" file for mysql nodes.
- [ ] source Openstack auth file for shade use.
- [ ] Ensure that you have access to private key that being used to provision the nodes.

# Execution
```
export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook -i hosts site.yaml --extra-vars "env=<environment name>" --key-file=/some/key/path

environment name: ops,dev1, etc.
```
Skip creation of heat stack
```
ansible-playbook -i hosts stack_launch.yaml --skip-tags "heat"
```

# Known Issues
There are some instances where the play will attempt to move on to the configuration of the nodes  before they're are ready to be ssh'd into. In those cases the playbook can simply be re-ran.

There is also a know issue where the replication group may fail if the hosts can't resolve themselves vi DNS.