# Working with For Expressions

Create resources for expressions and generate outputs. Remember, it starts in 0

```hcl
resource "aws_subnet" "subnet" {
  count = 4

  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.${count.index}.0/24"

  tags = {
    Name = "subnet-terraform-${count.index}"
  }
}
```

The outputs.tf file use the splat operator `[*]` to get all the values of the resource.

```hcl
output "subnet_id" {
  value = aws_subnet.subnet[*].id
}
```
instead

```hcl
output "subnet_id" {
  value = [for subnet in aws_subnet.subnet : subnet.id]
}
```


Reference: [Working with Splat Expressions](https://developer.hashicorp.com/terraform/language/expressions/splat)