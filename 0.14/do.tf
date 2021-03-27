resource "digitalocean_droplet" "do1" {
  image = "centos-7-x64"
  name = "docker01"
  region = "nyc3"
  size = "s-2vcpu-4gb"
  private_networking = true
  ssh_keys = [
    data.digitalocean_ssh_key.ssh_key.id
  ]
  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.pvt_key)
    timeout = "2m"
  }
  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      # install nginx
      "yum update -y",
      "yum -y install vim git"
    ]
  }
}
