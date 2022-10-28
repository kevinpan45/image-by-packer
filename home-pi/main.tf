resource "null_resource" "init_dev_env" {
  connection {
    type     = "ssh"
    host     = ""
    user     = ""
    password = ""
  }
  provisioner "remote-exec" {
    inline = [
      "apt-get update",
      "apt-get install -y --no-install-recommends vim git zip unzip",
      "curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun"
      # "curl -s \"https://get.sdkman.io\" | bash"
    ]
  }
}