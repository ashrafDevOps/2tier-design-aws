resource "aws_instance" "bastion" {
  count                  = var.create_bastion ? var.bastion_instance_count : 0
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = element(var.public_subnet_ids, count.index)
  key_name               = var.key_name
  vpc_security_group_ids = [var.bastion_sg_id]
  associate_public_ip_address = true

  tags = {
    Name = "${var.resource_name}-bastion-${count.index}"
  }

  connection {
    type         = "ssh"
    user         = "ec2-user"
    host         = self.public_ip
    private_key  = file("/home/ashraf/ec2-terraform.pem")
    # bastion_host = var.bastion-host
    # bastion_user = var.bastion-user
  }

    provisioner "remote-exec" {
    inline = [
      "sudo systemctl start nginx",
    "sudo systemctl enable nginx",
    "echo 'server { listen 80; location / { proxy_pass http://${var.load_blancer_dns}; }}' | sudo tee /etc/nginx/conf.d/proxy.conf",
    "sudo systemctl restart nginx"
    ]

}
}

# Private Instances
resource "aws_instance" "private" {
  count                  = var.create_private ? var.private_instance_count : 0
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = element(var.private_subnet_ids, count.index)
  key_name               = var.key_name
  vpc_security_group_ids = [var.private_sg_id]
  associate_public_ip_address = false

  tags = {
    Name = "${var.resource_name}-private-${count.index}"
  }

  connection {
    type         = "ssh"
    user         = "ec2-user"
    host         = self.private_ip
    private_key  = file("/home/ashraf/ec2-terraform.pem")
    # bastion_host = var.bastion_public_ip
    bastion_host = aws_instance.bastion[count.index].public_ip
    bastion_user = "ec2-user"
  }

    provisioner "remote-exec" {
    inline = [
      "echo 'Hello from Web Server 1' | sudo tee /usr/share/nginx/html/index.html",
    "sudo systemctl restart nginx"
    ]

}
}










    

# # انتظار 60 
# resource "time_sleep" "wait_for_instances" {
#   create_duration = "60s"
#   depends_on      = [aws_instance.bastion, aws_instance.private]
# }

