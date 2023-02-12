data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}


resource "aws_instance" "Bastion" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance-type
  subnet_id = var.public_subnet_id
  vpc_security_group_ids = [aws_security_group.only-ssh.id]
  provisioner "local-exec" {
    command = "echo ${self.public_ip}"
  }
}

resource "aws_instance" "Application" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance-type
  subnet_id = var.Private_subnet_id
  vpc_security_group_ids = [aws_security_group.ssh_and_3000.id]
}