resource "aws_instance" "ubuntu" {
  count         = var.instance_count
  ami           = var.amis[var.aws_region]
  instance_type = "t2.micro"
  key_name      = var.private_key_name
  vpc_security_group_ids = ["${aws_security_group.web_traffic.id}"]
  tags = {
     Name = "ubuntu-${count.index}"
          }
  connection {
    type        = "ssh"
    host        = self.public_ip
    private_key = file(var.path_to_private_key)
    user        = var.instance_username
  }

}
resource "null_resource" "ubuntu3" {
   count = length(var.instance_count)
  provisioner "local-exec" {
      command = "echo [Jenkins] >> ${var.host_file}"
    }
  provisioner "local-exec" {
      command = "echo ${element(aws_instance.ubuntu.*.public_ip, count.index)} >> ${var.host_file}"
    }
  provisioner "local-exec" {
      command = "echo [Docker] >> ${var.host_file}"
    }
  provisioner "local-exec" {
      command = "echo ${element(aws_instance.ubuntu.*.public_ip, count.index+1)} >> ${var.host_file}"
    }
  provisioner "local-exec" {
      command = "sleep 320; ansible-playbook -u ubuntu --private-key ./aws-private.pem -i hosts capstonProject.yml"
    }
 }

output "ec2_global_ips" {
  value = "${aws_instance.ubuntu.*.public_ip}"
}
