# Working with Conditionals Expressions

Create resource if environment is equal to `prod`:

```hcl
resource "aws_vpc" "vpc" {
  count = var.environment == "prod" ? 1 : 0
  # ...
}
```

If `var.environment` is equal to `develop` form example, then `count` will be equal to `1` otherwise `0` the output was:

```bash
$ terraform plan -out=plan.out

No changes. Your infrastructure matches the configuration.

Terraform has compared your real infrastructure against your configuration and found no differences, so no
changes are needed.
```

If `var.environment` is equal to `prod` form example, then `count` will be equal to `1` otherwise `0` the output was:

```bash
$ export TF_VAR_environment=prod
$ terraform plan -out=plan.out
terraform plan -out=plan.out  

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated
with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_vpc.vpc[0] will be created
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

Plan: 1 to add, 0 to change, 0 to destroy.

──────────────────────────────────────────────────────────────────────────────────────────────────────────────

Saved the plan to: plan.out

To perform exactly these actions, run the following command to apply:
    terraform apply "plan.out"
```


Reference: https://developer.hashicorp.com/terraform/language/expressions/conditionals