# AWS e Azure

## Configurar conta Azure

Para configurar a conta Azure, é necessário ter os seguintes dados:

1. Acessar seu console do Azure, pesquisar pelo serviço **Microsoft Entra ID** (antigo AD), agora clique na opção **App Registrations**;
2. Crie um novo aplicativo clicando em **New Registration** e dê um nome para o aplicativo, no meu caso vou chamá-lo de **terraform** e mantenha a opção padrão *Accounts in this organizational directory only (Default Directory only - Single tenant)** selecionada, clique em **Register*;
3. Copie o *Application (client) ID* e utilize-o para exportar na variável **ARM_CLIENT_ID**, depois, faça o mesmo com *Directory (tenant) ID* e exporte como a variável **ARM_TENANT_ID**;
4. Clique em **Certificates & secrets** e clique em **New client secret**, dê um nome para o segredo e clique em **Add**;
5. Em seguida, copie o valor do segredo **(value)** e exporte como a variável **ARM_CLIENT_SECRET**;
6. Agora, vá para a página inicial do Azure e clique em **Subscriptions**, clique na opção **Access Control (IAM)** e clique em **Add role assignment**;
7. Clique em **Privileged administrator roles** e selecione a opção **Contributor**, e clique em **Next**;
8. Em Members, clique em + Select members e e no campo de busca, digite o nome do aplicativo que você criou no passo **2.**, no meu caso, terraform, tique a caixinha e clique em **Select** e depois em **Next** e após, clique em **Review + assign** e depois em **Assign**;
9. Por fim, clique em **Subscriptions**, copie o ID da sua assinatura e a utilize para exportar na variável **ARM_SUBSCRIPTION_ID**.

Exportar variáveis de ambiente:

```bash
export ARM_CLIENT_ID="xxxxx"
export ARM_TENANT_ID="xxxxx"
export ARM_SUBSCRIPTION_ID="xxxxx"
export ARM_CLIENT_SECRET="xxxxx"
```



## Terraform (comandos comuns))

```bash
terraform init
terraform providers
```

Para formatar a identação do código, execute o comando:

```bash
terraform fmt
```

Para validar o código, execute o comando:

```bash
terraform validate
```

Para visualizar as alterações que serão realizadas, execute o comando:

```bash
terraform plan
terraform plan --out plan.out # Salvar o plano em um arquivo
```

Para visualizar o conteúdo do arquivo de plan, execute o comando:

```bash
terraform show plan.out
```

Para aplicar as alterações, execute o comando:

```bash
terraform apply
terraform apply plan.out # Aplicar o plano salvo
terraform apply -auto-approve # Aplicar sem precisar confirmar, ideal para utilizar em pipelines
```


