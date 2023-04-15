# Debugging
set -x

# Load variables
source "/etc/libvirt/hooks/kvm.conf"

# Unload vfio
modprobe -r vfio_pci
modprobe -r vfio_iommu_type1
modprobe -r vfio

# Rebind the GPU
virsh nodedev-reattach $VIRSH_GPU_VIDEO
virsh nodedev-reattach $VIRSH_GPU_AUDIO

# Rebind VTconsoles
echo 1 > /sys/class/vtconsole/vtcon0/bind
echo 0 > /sys/class/vtconsole/vtcon1/bind

# Bind EFI-framebuffer
#echo "efi-framebuffer.0" > /sys/bus/platform/drivers/efi-framebuffer/bind

# Load AMD/NVIDIA/WHATEVER
modprobe amdgpu

# Restart display service
systemctl start sddm
# Stop ssh, script executed correctly
systemctl stop sshd
