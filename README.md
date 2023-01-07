# Infrastructure template for DigitalOcean

This project create a whole infrastructure for your project in DigitalOcean.

## Requirements
- [Terraform.](https://developer.hashicorp.com/terraform)
- [DigitalOcean account.](https://m.do.co/c/09d0426d7d1f)

## First steps
1. Install Terraform following [this steps](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli#install-terraform).
2. Create a `terraform.tfvars` file like the following one:

```
# DIGITALOCEAN TOKENS
DIGITALOCEAN_ACCESS_TOKEN       = "your_access_token"
DIGITALOCEAN_SPACES_CLIENT_ID   = "spaces_id"
DIGITALOCEAN_SPACES_SECRET      = "spaces_secret"

# PROJECT
CREATE_NON_PRODUCTION_RESOURCES = true
PROJECT_DESCRIPTION             = "Project description"
PROJECT_NAME                    = "project-name"
REGION                          = "fra1"

# DOMAIN
DOMAIN_NAME                     = "domain"
DOMAIN                          = "domain.com"

# DATABASES
CREATE_DATABASES                = true
DATABASE_NAME                   = "project-database"
DATABASE_USER                   = "project-user"
DATABASE_USER_PASSWORD          = "project-password"

# SPACES
CREATE_SPACES                   = true
```
3. Initialize terraform running `terraform init`.
4. Verify the infrastructure is the desired one taking a look to it running `terraform plan`.
5. If it fits with your needs, run `terraform apply -auto-approve`.

## Considerations

By setting the `CREATE_NON_PRODUCTION_RESOURCES` variable to true, it will create a all teh needed for `dev` and `staging` environments (using the same droplet).

You can decide to create or not the database and/or the space setting the correspondent variable to the desired value. This way you can decide how much to pay (approximately costs for frankfurt region per month):

||Only production resources|With non production resources|
|---|:---:|:---:|
|Only Droplet|12€|24€|
|With Databases|17€|34€|
|With Spaces|42€|84€|
|With both Spaces and Database|47€|94€|
