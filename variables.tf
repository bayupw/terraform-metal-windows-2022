variable "project_name" {
  description = "Equinix Metal Project Name"
  type        = string
}

variable "hostname_prefix" {
  description = "hostname prefix"
  type        = string
  default     = "win2k2-"
}

variable "num_hosts" {
  description = "Number of hosts to be provisioned"
  type        = number
  default     = 1
}

variable "plan" {
  description = "Number of hosts to be provisioned"
  type        = string
  default     = "c3.small.x86"
}

variable "metro" {
  description = "Metro area"
  type        = string
  default     = "sy"
}

variable "os" {
  description = "Operating System"
  type        = string
  default     = "windows_2022"
}

variable "billing" {
  description = "Billing cycle"
  type        = string
  default     = "hourly"
}

variable "internet_vlan" {
  description = "Internet VLAN"
  type        = string
  default     = "255"
}

variable "edge_mgt_vlan" {
  description = "Edge Management VLAN"
  type        = string
  default     = "10"
}