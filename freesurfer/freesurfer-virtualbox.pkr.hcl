# Replace to your freesurfer install package name
variable "freesurfer_package_file" {
  type    = string
  default = "freesurfer-Linux-centos6_x86_64-stable-pub-v6.0.0.tar.gz"
}

source "vagrant" "freesurfer" {
  communicator    = "ssh"
  source_path     = "generic/ubuntu2004"
  provider        = "virtualbox"
  output_dir      = "builds/vagrant/freesurfer"
  add_force       = true
  skip_add        = true
  teardown_method = "destroy"
}

build {
  sources = [
    "source.vagrant.freesurfer"
  ]

  provisioner "file" {
    source      = "${var.freesurfer_package_file}"
    destination = "/tmp/${var.freesurfer_package_file}"
  }

  provisioner "shell" {
    execute_command = "echo 'packer' | sudo -S sh -c '{{ .Vars }} {{ .Path }}'"
    scripts         = ["./scripts/install.sh"]
  }

}
