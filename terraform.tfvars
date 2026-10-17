location              = "mexicocentral"
resource_group_name   = "rg-utvt-examen-dev-mxc-001"
app_service_plan_name = "asp-utvt-examen-dev-mxc-001"
web_app_name          = "app-utvt-examen-web-dev-mxc-001-leo"
vnet_name             = "vnet-utvt-examen-dev-mxc-001"
vnet_address_space    = ["10.0.0.0/16"]
subnet_name           = "snet-utvt-examen-app-dev-mxc-001"
subnet_address_prefix = "10.0.0.0/18"
asp_sku_name          = "B1"

tags = {
  environment = "dev"
  project     = "examen"
  org         = "utvt"
  managed_by  = "terraform"
}
