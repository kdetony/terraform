variable "DO_PAT" {} 
variable "priv_key" {
   default = "~/.ssh/id_rsa" 
}

variable "pub_key" { 
   default = "~/.ssh/id_rsa.pub"
}

variable "ssh_fingerprint" {
    
}


provider "digitalocean" { 
  token = var.DO_PAT 
}
