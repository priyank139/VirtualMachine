
# ####################################### for creating public Static Ip For Virtual Machine  #################
resource "azurerm_public_ip" "publicvm_public_ip" {
  count = length(var.rg_locations)
  name                = "publicvm-public-ip${count.index}"
  location            = element(var.rg_locations, count.index )
  resource_group_name = var.resource_group_name
  sku = "Standard"
  allocation_method   = "Static"
}


########################## Network Interface ############################

resource "azurerm_network_interface" "ot_publican_interface" {
  count                 = length(var.publicvm_name)
  name                  = "otservice-public-nic-${count.index}"
  location              = element(var.rg_locations, count.index )
  resource_group_name   = var.resource_group_name
  
 ip_configuration {
    name                          = length(var.public_subnet_id)
    subnet_id                     = element( var.public_subnet_id, count.index)
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element( var.public_id_vm, count.index)

  } 
}

# ###################################### Association Btw Interface and PublicNSG  ####################

resource "azurerm_network_interface_security_group_association" "ot_public_association" {
  count = length(var.public_natinter_id)
  network_interface_id  = element(var.public_natinter_id, count.index )
  network_security_group_id = element(var.public_NSG_id, count.index )
}


# ################################ Public Virtual Machine Creation Windows/Ubuntu  ####################

resource "azurerm_linux_virtual_machine" "ot_publicvirtual_machine" {  
  count                  = var.vm_type == "Ubuntu" ? length(var.publicvm_name) : 0
  name                   = element(var.publicvm_name, count.index ) 
  location               = element(var.rg_locations, count.index )
  resource_group_name    = var.resource_group_name  
    admin_username =  var.azureuser 
  admin_password = var.azurepassword 
  size = var.vm_size
    network_interface_ids = [
    azurerm_network_interface.ot_publican_interface[count.index].id
  ]
 admin_ssh_key {
    username   = var.azureuser 
    public_key = file("${var.keydata_path}")
     
  }
os_disk {
    name              = "ubuntupublic-otservice-disk-${count.index}"
    caching           = "ReadWrite"
    storage_account_type =  "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = var.skuubuntu #
    version   = "20.04.202212130"

  }
  
  
}
  




resource "azurerm_linux_virtual_machine" "ot_publicvirtual_windowmachine" {
  count                  = var.vm_type == "Windows" ? length(var.publicvm_name) : 0
  name                   = element(var.publicvm_name, count.index ) 
  location               = element(var.rg_locations, count.index )
  size = var.vm_size
  resource_group_name    = var.resource_group_name  
  admin_username =  var.azureuser 
  admin_password = var.azurepassword
  network_interface_ids = [
    azurerm_network_interface.ot_publican_interface[count.index].id
  ]

 os_disk {
    name              = "windows-public-otservice-disk-${count.index}"
    caching           = "ReadWrite"
    storage_account_type =  "Standard_LRS"
    
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     =  "WindowsServer"
    sku       = var.skuwindows 
    version   = "latest"

  }
  
}

############################



































