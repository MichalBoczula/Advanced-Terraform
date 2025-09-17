resource "azurerm_virtual_machine_extension" "nginx" {
  name                 = "nginx-bootstrap"
  virtual_machine_id   = azurerm_linux_virtual_machine.vm.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.1"

  settings = jsonencode({
    commandToExecute = "bash -c 'sudo apt-get update -y && sudo apt-get install -y nginx && echo \"<h1>First VM</h1>\" | sudo tee /var/www/html/index.html >/dev/null && sudo systemctl enable nginx && sudo systemctl restart nginx'"
  })
}
