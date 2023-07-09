resource "proxmox_vm_qemu" "node" {
    count = var.NumberOfVms
    name = "node${count.index + 1}"

    # Template to use
    target_node = "hv01"
    full_clone = true
    clone = "ubuntu-2204-lts"

    # Basic VM settings
    # Only set agent to 1 when the cloud image has the qemu-guest-agent installed
    agent = 0
    os_type = "cloud-init"
    cores = 2
    sockets = 1
    cpu = "host"
    memory = 2048
    scsihw = "virtio-scsi-pci"
    bootdisk = "scsi0"

    # Disk settings
    disk {
        slot = 0
        # set disk size here. leave it small for testing because expanding the disk takes time.
        size = "25G"
        type = "scsi"
        storage = "local-lvm"
        #iothread = 1
    }

    # if you want two NICs, just copy this whole network section and duplicate it
    network {
        model = "virtio"
        bridge = "vmbr0"
    }

    # not sure exactly what this is for. presumably something about MAC addresses and ignore network changes during the life of the VM
    lifecycle {
        ignore_changes = [
        network,
        ]
    }

    ipconfig0=dhcp

}