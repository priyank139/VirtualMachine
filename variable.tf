
variable "rg_locations" {
  type = any
}

variable "resource_group_name" {
  type = string
}

variable "public_subnet_id" {
  type = list(string)
}
variable "vm_type" {
  type = string
}

variable "public_id_vm" {
  type = list(string)
}


variable "public_NSG_id" {
  type = list(string)
}
variable "public_natinter_id" {
  type = list(string)
}
variable "publicvm_name" {
  type = list(string)
}
variable "vm_size" {
  type = string
}
variable "skuubuntu" {
  type = string
}
variable "skuwindows" {
  type = string
}
variable "azureuser" {
  type = string
}

variable "keydata_path" {
  type = string
}
variable "azurekyvaulsecretname" {
  type = string
}
variable "keyvaultid" {
  type = string
}













# variable "rglocation" {
#   type = list(string)
# }

# variable "resource_group_name" {
#   type = string
# }

# variable "public_subnet_id" {
#   type = list(string)
# }
# variable "vm_type" {
#   type = string
# }

# variable "public_id_vm" {
#   type = list(string)
# }


# variable "public_NSG_id" {
#   type = list(string)
# }
# variable "public_natinter_id" {
#   type = list(string)
# }
# variable "publicvm_name" {
#   type = list(string)
# }
# variable "vm_size" {
#   type = string
# }
# variable "skuubuntu" {
#   type = string
# }
# variable "skuwindows" {
#   type = string
# }
# variable "azureuser" {
#   type = string
# }

# variable "keydata_path" {
#   type = string
# }
# variable "azurekyvaulsecretname" {
#   type = string
# }
# variable "keyvaultid" {
#   type = string
# }