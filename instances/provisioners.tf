# # Provisioners  NGINX ـ Bastion
# resource "null_resource" "bastion_provisioners" {
#   count = var.create_bastion ? var.bastion_instance_count : 0

#   provisioner "file" {
#     connection {
#       type        = "ssh"
#       user        = "aws-Linux"
#       private_key = file(var.key_path)
#       host        = aws_instance.bastion[count.index].public_ip
#     }
#     # source      = var.key_path
#     # destination = "/home//my-key-pair.pem"

#   }

#   # تنصيب وتشغيل NGINX
#   provisioner "remote-exec" {
#     connection {
#       type        = "ssh"
#       user        = "ubuntu"
#       private_key = file(var.key_path)
#       host        = aws_instance.bastion[count.index].public_ip
#     }
#     inline = [
#       "chmod 600 /home/ubuntu/my-key-pair.pem",
#       "sudo apt-get update -y",
#       "sudo apt-get install -y nginx",
#       "sudo systemctl start nginx",
#       "sudo systemctl enable nginx",
#       "echo 'NGINX installed successfully!' > /var/www/html/index.html"
#     ]
#   }

#   # depends_on = [time_sleep.wait_for_instances]
# }