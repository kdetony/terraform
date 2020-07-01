resource "digitalocean_ssh_key" "lade100" { 
  name = "lade100"
  public_key = "${file("id_rsa.pub")}"
}


resource "digitalocean_droplet" "docker" { 
     image = "centos-7-x64" 
     name = "docker" 
     region = "nyc3"
     size = "s-1vcpu-3gb"
     private_networking = true
     #ssh_keys = [var.ssh_fingerprint]
     ssh_keys = ["${digitalocean_ssh_key.lade100.fingerprint}"]       

connection {
     host = self.ipv4_address
     user = "root"
     type = "ssh"
     timeout = "2m"
     private_key = "${file(var.priv_key)}"
     
}
provisioner  "remote-exec" { 
  inline = [
    "export PATH=$PATH:/usr/bin",
    "yum -y install epel-release", 
    "yum -y install vim vim-enhanced rsync htop curl wget",
    "systemctl disable firewalld",
    "curl -fsSL https://get.docker.com -o get-docker.sh",
    "sh get-docker.sh",
    "systemctl enable docker",
    "systemctl start docker" 
          ]
 }
}
