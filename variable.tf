variable "server_name" {
  description = "The name of the MySQL flexible server"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the MySQL flexible server"
  type        = string
}

variable "db_login" {
  description = "The administrator login for MySQL"
  type        = string
}

variable "db_password" {
  description = "The administrator password for MySQL"
  type        = string
}

variable "backup_retention_days" {
  description = "The number of days to retain backups"
  type        = number
}

variable "delegated_subnet_id" {
  description = "The subnet ID for the delegated subnet"
  type        = string
}

variable "private_dns_zone_id" {
  description = "The private DNS zone ID"
  type        = string
}

variable "sku_name" {
  description = "The SKU for the MySQL server"
  type        = string
}

variable "db_version" {
  description = "The version of MySQL"
  type        = string
}

variable "config_name" {
  description = "The configuration name for MySQL"
  type        = string
}

variable "config_value" {
  description = "The configuration value for MySQL"
  type        = string
}

variable "database_name" {
  description = "The name of the database"
  type        = string
}

variable "charset" {
  description = "The character set for the database"
  type        = string
}

variable "collation" {
  description = "The collation for the database"
  type        = string
}
