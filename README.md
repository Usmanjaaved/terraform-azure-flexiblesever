# Terraform Azure MySQL Flexible Server Module

Prerequisite . (we need to create subnet virtual network link and private DNS )

This Terraform module simplifies the provisioning and configuration of an Azure MySQL Flexible Server. It creates the server, applies necessary configurations, and provisions a database with user-defined parameters.

## Features
- Provisioning of an Azure MySQL Flexible Server.
- Customizable server configurations, including version and SKU.
- Automatic creation of a database with specified charset and collation.
- Integration with private DNS zones and delegated subnets.

## Usage

### Root Module Example
```hcl
module "mysql" {
  source               = "./modules/mysql"
  db_version           = var.db_version
  server_name          = "devteam24-fs"
  resource_group_name  = module.azurerm_resource_group.resource_group_name
  location             = module.azurerm_resource_group.resource_group_location
  db_login             = var.db_login
  db_password          = module.key_vault_secret.secret_value
  backup_retention_days = 7
  delegated_subnet_id  = module.sql_subnet.subnet_id
  sku_name             = "B_Standard_B1s"
  depends_on           = [module.key_vault_secret, module.vnet_link, module.private_dns_zone]
  config_name          = "require_secure_transport"
  config_value         = "OFF"
  database_name        = "devteam24"
  charset              = "utf8"
  collation            = "utf8_unicode_ci"
  private_dns_zone_id  = module.private_dns_zone.id
}
```

## Input Variables

| Name                   | Description                                        | Type     | Default | Required |
|------------------------|----------------------------------------------------|----------|---------|----------|
| `server_name`          | The name of the MySQL flexible server.             | `string` | n/a     | Yes      |
| `resource_group_name`  | The name of the resource group.                   | `string` | n/a     | Yes      |
| `location`             | The location of the MySQL flexible server.         | `string` | n/a     | Yes      |
| `db_login`             | The administrator login for MySQL.                | `string` | n/a     | Yes      |
| `db_password`          | The administrator password for MySQL.             | `string` | n/a     | Yes      |
| `backup_retention_days`| The number of days to retain backups.             | `number` | 7       | No       |
| `delegated_subnet_id`  | The subnet ID for the delegated subnet.            | `string` | n/a     | Yes      |
| `private_dns_zone_id`  | The private DNS zone ID.                           | `string` | n/a     | Yes      |
| `sku_name`             | The SKU for the MySQL server.                      | `string` | `B_Standard_B1s` | No |
| `db_version`           | The version of MySQL.                              | `string` | n/a     | Yes      |
| `config_name`          | The configuration name for MySQL.                 | `string` | n/a     | Yes      |
| `config_value`         | The configuration value for MySQL.                | `string` | n/a     | Yes      |
| `database_name`        | The name of the database.                          | `string` | n/a     | Yes      |
| `charset`              | The character set for the database.               | `string` | `utf8`  | No       |
| `collation`            | The collation for the database.                   | `string` | `utf8_unicode_ci` | No |

## Outputs

| Name                  | Description                            |
|-----------------------|----------------------------------------|
| `mysql_server_name`   | The name of the MySQL server.          |
| `mysql_database_name` | The name of the created database.      |

## Prerequisites
- An existing Azure resource group.
- Private DNS zones and delegated subnets configured in Azure.
- Azure Key Vault for secure storage of sensitive information like passwords.

## Example Scenario
For setting up a MySQL Flexible Server named `devteam24`:

1. Configure the necessary Azure infrastructure (e.g., resource group, subnet, and DNS zones).
2. Store the database administrator password securely in Azure Key Vault.
3. Use the example `Usage` code above to provision the server and database.
4. Run `terraform apply` to deploy the infrastructure.



