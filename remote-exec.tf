resource "null_resource" "github_runner_setup" {
  depends_on = [proxmox_virtual_environment_container.lxc_container]

  triggers = {
    container_id = proxmox_virtual_environment_container.lxc_container.id
  }

  connection {
    type        = "ssh"
    user        = "root"
    private_key = var.ssh_private_key
    host        = split("/", var.lxc_static_ip)[0]
    timeout     = "5m"
  }

  provisioner "remote-exec" {
    script = var.lxc_provision_script_path
  }
}