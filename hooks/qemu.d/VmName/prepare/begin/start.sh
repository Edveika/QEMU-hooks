# Debugging
set -x

# Load variables
source "/etc/libvirt/hooks/kvm.conf"

# Stops display manager
systemctl stop sddm
# Starts sshd in case something goes wrong
systemctl start sshd

# Unbind VTconsoles
echo 0 > /sys/class/vtconsole/vtcon0/bind
echo 0 > /sys/class/vtconsole/vtcon1/bind

# Unbind EFI-Framebuffer
#echo efi-framebuffer.0 > /sys/bus/platform/drivers/efi-framebuffer/unbind

# Avoid race condition
sleep 3

# Unload drivers
modprobe -r amdgpu

# Unbind GPU
virsh nodedev-detach $VIRSH_GPU_VIDEO
virsh nodedev-detach $VIRSH_GPU_AUDIO

# Load VFIO
modprobe vfio
modprobe vfio-pci
modprobe vfio_iommu_type1
