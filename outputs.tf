output "mysql_server_name" {
  value = azurerm_mysql_flexible_server.devteam24.name
}

output "mysql_database_name" {
  value = azurerm_mysql_flexible_database.devteam24.name
}
