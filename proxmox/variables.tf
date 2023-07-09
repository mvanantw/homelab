variable "pm_api_url" {
  type        = string
  default     = ""
  description = "The URL of the Proxmox API. For example: https://192.168.0.100:8006/api2/json."
}

variable "pm_tls_insecure" {
  default     = true
  description = "Set to true when using a selfsigned certificate."
}

variable "pm_api_token_id" {
  type        = string
  default     = ""
  description = "This is the token ID of the provisioning user. For example: terraform-prov@pve!MyTokeID."
}

variable "pm_api_token_secret" {
  type        = string
  default     = ""
  description = "The token secret that belongs to the toke ID above."
  sensitive   = true
}

variable "NumberOfVms" {
  type        = number
  description = "Number of VMs to create."
}
