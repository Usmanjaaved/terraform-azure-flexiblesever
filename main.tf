resource "azurerm_mysql_flexible_server" "devteam24" {
  name                   = var.server_name
  resource_group_name    = var.resource_group_name
  location               = var.location
  administrator_login    = var.db_login
  administrator_password = var.db_password
  backup_retention_days  = var.backup_retention_days
  delegated_subnet_id    = var.delegated_subnet_id
  private_dns_zone_id    = var.private_dns_zone_id
  sku_name               = var.sku_name
  version                = var.db_version

}

resource "azurerm_mysql_flexible_server_configuration" "require_secure_transport" {
  name                = var.config_name
  value               = var.config_value
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.devteam24.name

  depends_on = [azurerm_mysql_flexible_server.devteam24]   
}

resource "azurerm_mysql_flexible_database" "devteam24" {
  name                = var.database_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.devteam24.name
  charset             = var.charset
  collation           = var.collation
}
