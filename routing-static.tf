# Creates a route table to direct traffic from the subnet to the internet gateway
resource "oci_core_route_table" "cabbage_route_table" {
  compartment_id           = var.compartment_ocid                      # Compartment for the route table
  vcn_id                   = oci_core_virtual_network.cabbage_vcn.id   # VCN ID for the route table
  display_name             = "${local.route_table_name_prefix}001"     # Name of the route table
  route_rules {
    destination            = "0.0.0.0/0"                               # Route all traffic
    destination_type       = "CIDR_BLOCK"                              # Type of destination
    network_entity_id      = oci_core_internet_gateway.cabbage_igw.id  # Target internet gateway
  }
}