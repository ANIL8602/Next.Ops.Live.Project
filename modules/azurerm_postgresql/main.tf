
resource "azurerm_private_dns_zone" "postgresql" {
  name                = var.private_dns_zone_name
  resource_group_name = var.resource_group_name

  tags = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "postgresql" {
  name                = "nextops-postgres-vnet-link"
  private_dns_zone_id = azurerm_private_dns_zone.postgresql.id
  virtual_network_id  = var.virtual_network_id
}
resource "azurerm_postgresql_flexible_server" "postgresql" {
  name                = var.server_name
  resource_group_name = var.resource_group_name
  location            = var.location

  version                = "16"
  delegated_subnet_id    = var.delegated_subnet_id
  private_dns_zone_id    = azurerm_private_dns_zone.postgresql.id
  public_network_access_enabled = false

  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password

  sku_name   = var.sku_name
  storage_mb = var.storage_mb

  storage_tier          = "P4"
  backup_retention_days = 7

  tags = var.tags

  depends_on = [
    azurerm_private_dns_zone_virtual_network_link.postgresql
  ]
}

resource "azurerm_postgresql_flexible_server_database" "database" {
  name      = var.database_name
  server_id = azurerm_postgresql_flexible_server.postgresql.id
  charset   = "UTF8"
  collation = "en_US.utf8"
}
