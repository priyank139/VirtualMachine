output "public_ip_vm" {
  value = "${formatlist("%s",azurerm_public_ip.publicvm_public_ip.*.ip_address)}"
}

output "public_id_vm" {
  value = "${formatlist("%s",azurerm_public_ip.publicvm_public_ip.*.id)}"  
}
# output "natpvt_ip" {
#     value = "${formatlist("%v",azurerm_network_interface.ot_an_interface[0].ip_configuration.*.private_ip_address)}"
# }


output "public_ip_vm1" {
  value = "${formatlist("%s",azurerm_public_ip.publicvm_public_ip[0].ip_address)}"
}
# output "natinter_id" {
#     value = "${formatlist("%v",azurerm_network_interface.ot_an_interface.*.id)}"
#}
output "public_natinter_id" {
  value = "${formatlist("%v",azurerm_network_interface.ot_publican_interface.*.id)}"
}

# output "natinter_name" {
#     value = "${formatlist("%v",azurerm_network_interface.ot_an_interface.*.name)}"
# }