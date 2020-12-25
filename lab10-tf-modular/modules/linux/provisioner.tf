resource "null_resource" "linux_provisioner" {
  count = var.nb_count
  depends_on = [
    azurerm_linux_virtual_machine.vmlinux,
    azurerm_network_interface.linux_nic,
  ]

  triggers = {
    network_interface_ids = join(",", azurerm_network_interface.linux_nic.*.id)
  }

  provisioner "local-exec" {
    command = "sleep 5 ; cat /etc/os-release"
  }

}
