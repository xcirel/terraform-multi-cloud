## Terraform Import

Imagine que você entrou em um projeto e passará a gerenciar uma infra que já existia e havia sido criada manualmente e, a partir de agora irá utilizar o Terraform como ferramenta também.

```sh
terraform import aws_s3_bucket.bucket_terraform_import ericsantos-terraform-import
```