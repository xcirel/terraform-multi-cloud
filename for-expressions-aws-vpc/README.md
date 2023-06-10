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

```bash
terraform plan -out=plan.out

Terraform used the selected providers to generate the following execution plan.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_subnet.subnet[0] will be created
  + resource "aws_subnet" "subnet" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = (known after apply)
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.0.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name" = "subnet-terraform-0"
        }
      + tags_all                                       = {
          + "Name"       = "subnet-terraform-0"
          + "managed-by" = "terraform"
          + "owner"      = "ericsantos"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_subnet.subnet[1] will be created
  + resource "aws_subnet" "subnet" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = (known after apply)
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.1.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name" = "subnet-terraform-1"
        }
      + tags_all                                       = {
          + "Name"       = "subnet-terraform-1"
          + "managed-by" = "terraform"
          + "owner"      = "ericsantos"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_subnet.subnet[2] will be created
  + resource "aws_subnet" "subnet" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = (known after apply)
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.2.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name" = "subnet-terraform-2"
        }
      + tags_all                                       = {
          + "Name"       = "subnet-terraform-2"
          + "managed-by" = "terraform"
          + "owner"      = "ericsantos"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_vpc.vpc will be created
  + resource "aws_vpc" "vpc" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.0.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = (known after apply)
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "Name" = "vpc-terraform"
        }
      + tags_all                             = {
          + "Name"       = "vpc-terraform"
          + "managed-by" = "terraform"
          + "owner"      = "ericsantos"
        }
    }

Plan: 4 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + subnet_id = [
      + (known after apply),
      + (known after apply),
      + (known after apply),
    ]
```

Applying the plan, see the resources being created:

```bash
terraform apply plan.out
aws_vpc.vpc: Creating...
aws_vpc.vpc: Creation complete after 3s [id=vpc-025c5c66b3c275275]
aws_subnet.subnet[2]: Creating...
aws_subnet.subnet[3]: Creating...
aws_subnet.subnet[0]: Creating...
aws_subnet.subnet[1]: Creating...
aws_subnet.subnet[0]: Creation complete after 1s [id=subnet-06e9fcb74e4a422d4]
aws_subnet.subnet[3]: Creation complete after 1s [id=subnet-0a0ba57273989dad7]
aws_subnet.subnet[2]: Creation complete after 1s [id=subnet-08c8cab559c49f831]
aws_subnet.subnet[1]: Creation complete after 1s [id=subnet-074605a51cac6d568]

Apply complete! Resources: 5 added, 0 changed, 0 destroyed.

Outputs:

subnet_id = [
  "subnet-06e9fcb74e4a422d4",
  "subnet-074605a51cac6d568",
  "subnet-08c8cab559c49f831",
  "subnet-0a0ba57273989dad7",
]
```

[!(../_images/for-expressions-aws-vpc.png)]


Reference: [Working with For Expressions](https://developer.hashicorp.com/terraform/language/expressions/for)