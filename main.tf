data "metal_project" "project" {
  name = var.project_name
}

# Create a Equinix Metal Server - Windows 2022
resource "metal_device" "win_hosts" {
  count = var.num_hosts

  hostname         = format("%s%02d", var.hostname_prefix, count.index + 1)
  plan             = var.plan
  metro            = var.metro
  operating_system = var.os
  billing_cycle    = var.billing
  project_id       = data.metal_project.project.id
}

# Set Network to Hybrid
resource "metal_device_network_type" "win_hosts" {
  count = var.num_hosts

  device_id = metal_device.win_hosts[count.index].id
  type      = "hybrid"
}

# Add Internet VLAN to Bond
resource "metal_port_vlan_attachment" "internet" {
  count = var.num_hosts

  device_id = metal_device_network_type.win_hosts[count.index].id
  port_name = "bond0"
  vlan_vnid = var.internet_vlan
}

# Add Edge-MGT VLAN to Bond
resource "metal_port_vlan_attachment" "edge_mgt" {
  count = var.num_hosts

  device_id = metal_device_network_type.win_hosts[count.index].id
  port_name = "bond0"
  vlan_vnid = var.edge_mgt_vlan
}
