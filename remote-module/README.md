To create a key pair 

```sh
ssh-keygen -f azure-key-terraform
```

How I need to have a resource group, made this task in two steps
- Created a resource group
- I created a VM and maintained the resource group block (observe here the idempotence)