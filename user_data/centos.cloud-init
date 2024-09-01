#cloud-config
package_update: true
packages:
  - epel-release
  - kernel-devel
  - kernel-headers
  - dkms
  - gcc
  - make
  - bzip2
  - perl
  - elfutils-libelf-devel
  - virtualbox-guest-additions
runcmd:
  - sudo modprobe vboxsf
  - sudo systemctl restart vboxadd.service