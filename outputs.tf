output "rg_id" {
  value       = azurerm_resource_group.rg.id
  description = "Resource Group ID"
}

output "rg_name" {
  value       = azurerm_resource_group.rg.name
  description = "Resource Group name"
}

output "storage_account_name" {
  value       = azurerm_storage_account.sa.name
  description = "Storage account name"
}

output "vnet_name" {
  value       = azurerm_virtual_network.vnet.name
  description = "Virtual Network name"
}

output "subnet_name" {
  value       = azurerm_subnet.subnet.name
  description = "Subnet name"
}

# NSG basics
output "nsg_name" {
  value       = azurerm_network_security_group.nsg.name
  description = "Network Security Group name"
}

output "nsg_id" {
  value       = azurerm_network_security_group.nsg.id
  description = "Network Security Group resource ID"
}

# Show the SSH rule priority (useful sanity check)
output "nsg_allow_ssh_priority" {
  value       = one([for r in azurerm_network_security_group.nsg.security_rule : r.priority if r.name == "Allow-SSH"])
  description = "Priority of the Allow-SSH rule"
}

# Subnet ↔ NSG association (proves it’s attached)
output "subnet_nsg_association_id" {
  value       = azurerm_subnet_network_security_group_association.subnet_nsg.id
  description = "ID of the Subnet-NSG association"
}

output "public_ip_address" {
  value       = azurerm_public_ip.pip.ip_address
  description = "Public IP that your future VM/NIC will use"
}

output "nic_id" {
  value       = azurerm_network_interface.nic.id
  description = "NIC resource ID"
}

output "vm_public_ip" {
  value       = azurerm_public_ip.pip.ip_address
  description = "Public IPv4 of the VM"
}

output "vm_private_ip" {
  value       = azurerm_network_interface.nic.ip_configuration[0].private_ip_address
  description = "Private IP from the subnet"
}