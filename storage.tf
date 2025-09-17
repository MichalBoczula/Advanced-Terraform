# Unique suffix so the name is globally unique (required by Azure)
resource "random_string" "sa_suffix" {
  length  = 6
  upper   = false
  special = false
}

# Storage Account (must be 3–24 chars, lowercase only, globally unique)
resource "azurerm_storage_account" "sa" {
  name                     = "st${random_string.sa_suffix.result}"
  resource_group_name      = azurerm_resource_group.rg.name # same RG: advance-terraform
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}
