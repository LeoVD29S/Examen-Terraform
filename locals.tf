locals {
  # Nombres centralizados (facilita evidencias del examen)
  rg_name   = var.resource_group_name
  asp_name  = var.app_service_plan_name
  app_name  = var.web_app_name
  vnet_name = var.vnet_name
  snet_name = var.subnet_name

  common_tags = merge(var.tags, {
    region = var.location
  })
}
