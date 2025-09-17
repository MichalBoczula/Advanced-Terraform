variable "rg_name" {
  type        = string
  default     = "advance-terraform"
  description = "Name of the Resource Group"
}

variable "location" {
  type        = string
  default     = "westeurope" # closest to Poland
  description = "Azure region"
}

variable "tags" {
  type = map(string)
  default = {
    env = "dev"
    app = "advance-terraform"
    iac = "terraform"
  }
  description = "Common tags"
}

variable "allowed_ssh_cidr" {
  type        = string
  default     = "*" # quick start; later: "YOUR.PUBLIC.IP.ADDR/32"
  description = "CIDR allowed to SSH to the VM"
}

variable "ssh_public_key_path" {
  type        = string
  default     = "C:/Users/micha/.ssh/id_rsa.pub" # use forward slashes on Windows
  description = "Path to your SSH public key file"
}

variable "admin_username" {
  type        = string
  default     = "azureuser" # change if you prefer
  description = "Linux admin username used for SSH"
}