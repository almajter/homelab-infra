variable "pve_api_token" {
  description = "Proxmox API token, format: terraform@pve!tf=<secret>"
  type        = string
  sensitive   = true
}

variable "domain" {
  type    = string
  default = "alters.si"
}

