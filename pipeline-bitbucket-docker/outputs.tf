output "vm_aws_ip" {
  value = aws_instance.vm_docker.public_ip
}