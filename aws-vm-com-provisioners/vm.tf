resource "aws_key_pair" "key" {
  key_name   = "aws-key-terraform"
  public_key = file("./aws-key-terraform.pub")
}

resource "aws_instance" "vm" {
  ami                         = "ami-053b0d53c279acc90" # Ubuntu 22.04 LTS
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = data.terraform_remote_state.vpc.outputs.subnet_id
  vpc_security_group_ids      = [data.terraform_remote_state.vpc.outputs.security_group_id]
  associate_public_ip_address = true

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> public_ip.txt"
  }  

  # Copies the string in content into /tmp/file.log
  provisioner "file" {
    content     = "public_ip: ${self.public_ip}"
    destination = "/tmp/public_ip.txt"
  }

  # Copies the myapp.conf file to /etc/myapp.conf
  provisioner "file" {
    source      = "./test.txt"
    destination = "/tmp/example-test.txt"
  }

  # Establishes connection to be used by all
  # generic remote provisioners (i.e. file/remote-exec)
  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("./aws-key-terraform") # is necessary open the file
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "echo ami: ${self.ami} >> ~/ami.txt",
      "echo private_ip: ${self.private_ip} >> ~/private_ip.txt",
    ]
  }

  tags = {
    "Name" = "vm-terraform"
  }
}

