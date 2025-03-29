variable "tenancy_ocid" {
  type        = string
  description = "Your OCI tenancy ID, found in OCI console under Tenancy"
}

variable "user_ocid" {
  type        = string
  description = "Your OCI user ID, found in OCI console under User Settings"
}

variable "fingerprint" {
  type        = string
  description = "Fingerprint of your API key, generated when creating the key pair"
}

variable "private_key_path" {
  type        = string
  description = "Local path to your private key file"
}

variable "region" {
  type        = string
  description = "OCI region for deployment"
}

variable "compartment_ocid" {
  type        = string
  description = "Your compartment ID, found in OCI console under Compartments"
}

variable "environment_name" {
  type        = string
  description = "Name for your environment, used in resource naming (e.g., sandbox)"
}

variable "location" {
  type        = string
  description = "Location identifier, used in resource naming (e.g., eastus)"
}

variable "my_public_ip" {
  type        = string
  description = "Your public IP for RDP access"
}