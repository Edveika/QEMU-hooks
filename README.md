# QEMU-hooks

Custom hook script for single GPU passthrough for Linux that I use.

# Installing the hooks
1. Get device IDs using ``lspci -nnk``
2. Add the IDs to this [file](https://github.com/Edveika/QEMU-hooks/blob/e835b58ba9ffa179114dedbbb16754986408cc00/hooks/kvm.conf#L1)
3. Run install.sh ``sudo sh install.sh`` or copy ``hooks/`` folder into ``/etc/libvirt/``

# Debian linux dependencies

```
sudo apt update

sudo apt install virt-manager qemu-kvm qemu-utils libvirt-daemon-system libvirt-clients bridge-utils virt-manager ovmf

sudo apt install ebtables iptables dnsmasq
```

# Arch linux dependencies

```
sudo pacman -Syu

sudo pacman -S qemu libvirt virt-manager ovmf

sudo pacman -S ebtables iptables dnsmasq
```

# Fedora linux dependencies

```
sudo dnf update

sudo dnf install virt-manager qemu-kvm-core qemu-tools libvirt-daemon-lxc libvirt-client bridge-utils virt-manager

sudo dnf install edk2-ovmf ebtables iptables dnsmasq
```

# Starting the services(systemd)

```
sudo systemctl enable libvirtd.service

sudo systemctl start libvirtd.service

sudo systemctl enable virtlogd.socket

sudo systemctl start virtlogd.socket

sudo virsh net-autostart default
```

Reboot
