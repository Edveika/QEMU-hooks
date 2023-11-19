# QEMU-hooks

Custom hook script for single GPU passthrough for Linux that I use.

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
