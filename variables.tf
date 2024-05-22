variable "vultr_token" {
    description = "Vultr API token"
    type = string
}

variable "cloudflare_api_token" {
    description = "Cloudflare API token"
    type = string
}

variable "cloudflare_zone_id" {
    description = "Cloudflare zone ID"
    type = string
}

variable "domain" {
    description = "The domain of the Trojan server"
    type = string
}

variable "password" {
    description = "The password of the Trojan server"
    type = string
}

variable "plan" {
  description = "The plan of the server instance, you can get all plans by running `curl -H 'Authorization: Bearer VULTR_ACCESS_TOKEN' https://api.vultr.com/v2/plans`"
  type = string
  default = "vc2-1c-1gb"
}

variable "region" {
    description = "The region where the Droplet will be created"
    type = string
}

variable "hostname" {
    description = "The hostname of the server"
    type = string
    default = "trojan"
}

variable "ssh_key_id" {
    description = "The id of the SSH key"
    type = string
    default = "728ddbd4-73aa-409d-ace7-f75e60a37b8b"
}

variable "ssh_private_key" {
    description = "The private key of the SSH key"
    type = string
    default = "~/.ssh/id_rsa"
}



