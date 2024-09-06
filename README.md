# # Terraform and Ansible Demo w/ VirtualBox

Terraform: Uses [Virtualbox provider by terra-farm](https://registry.terraform.io/providers/terra-farm/virtualbox/latest/docs).

## Pre-requisites
- [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

**Notes:**
- *SSH Pass package (`sshpass`) needs to be installed on the Ansible control node if using SSH username and password in reaching managed nodes.*
- *Ansible control node requires GNU/Linux or Unix based operating system, e.g. Linux, MacOS. For Windows based machines, a virtual machine via WSL or VirtualBox VM located with the same network as managed nodes can be provisioned.*
- *A VirtualBox host only network adapter must be created and identified prior to running the automation scripts.*

## Usage
1. Provisioning using **Terraform**:
2. Configuration management using **Ansible**:
3. For automated steps found in 1 and 2, `automate.sh` can be used if the host machine is use is using GNU/Linux or Unix based operating system (Terraform and Ansible is installed in the host machine, serving as the control node).
    ```bash
    $ bash automate.sh
    ```
4. For cleanup of the environment, run the following command:
    ```bash
    $ terraform destroy
    ```

## Setup

### For GNU/Linux or Unix Based Machines
<img src="_assets/for_gnu-linux_unix.png">

### For Windows Based Machines
<img src="_assets/for_windows.png">