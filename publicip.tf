resource "azurerm_public_ip" "pip" {
  name                = "pip-advance"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  allocation_method = "Static"   # keeps the IP stable
  sku               = "Standard" # fine for learning;

  tags = var.tags
}
