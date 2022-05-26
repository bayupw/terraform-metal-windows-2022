output "hostname" {
  value = metal_device.win_hosts[*].hostname
}

output "public_ips" {
  value = metal_device.win_hosts[*].access_public_ipv4
}

output "private_ips" {
  value = metal_device.win_hosts[*].access_private_ipv4
}