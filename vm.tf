resource "azurerm_linux_virtual_machine" "vm" {
  name                = "vm-advance"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  size                = "Standard_B1s"     # cheap learning size
  admin_username      = var.admin_username # from variables.tf
  network_interface_ids = [
    azurerm_network_interface.nic.id # your existing NIC
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  # Ubuntu 22.04 LTS (Jammy)
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  # SSH only (no passwords)
  disable_password_authentication = true

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.ssh_public_key_path)
  }

  tags = var.tags
}
