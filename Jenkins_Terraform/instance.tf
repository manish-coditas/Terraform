resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  key_name = aws_key_pair.mykeypair.key_name
  subnet_id = aws_subnet.main-public-1.id
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]
  iam_instance_profile = aws_iam_instance_profile.S3-profile.name

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo sed -i -e 's/\r$//' /tmp/script.sh",  # Remove the spurious CR characters.
      "sudo /tmp/script.sh",
    ]
  }
  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = var.INSTANCE_USERNAME
    private_key = tls_private_key.mykeypair.private_key_pem
    #private_key = file(var.PATH_TO_PRIVATE_KEY)
  }

  tags = {
    Name = "HelloWorld"
  }
}

output "ip"{
  value = aws_instance.example.public_ip
}
