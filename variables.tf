variable "location" {
  description = "Region de Azure (codigo mxc = Mexico Central)"
  type        = string
  default     = "mexicocentral"
}

variable "resource_group_name" {
  type    = string
  default = "rg-utvt-examen-dev-mxc-001"
}

variable "app_service_plan_name" {
  type    = string
  default = "asp-utvt-examen-dev-mxc-001"
}

variable "web_app_name" {
  description = "Nombre global unico de la Web App"
  type        = string
  default     = "app-utvt-examen-web-dev-mxc-001"
}

variable "vnet_name" {
  type    = string
  default = "vnet-utvt-examen-dev-mxc-001"
}

variable "vnet_address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "subnet_name" {
  type    = string
  default = "snet-utvt-examen-app-dev-mxc-001"
}

variable "subnet_address_prefix" {
  description = "CIDR de la subred. Examen: 10.0.1.0/18 (invalido). Se usa 10.0.0.0/18 alineado."
  type        = string
  default     = "10.0.0.0/18"
}

variable "asp_sku_name" {
  description = "B1 permite VNet Integration (F1 no)"
  type        = string
  default     = "B1"
}

variable "tags" {
  type = map(string)
  default = {
    environment = "dev"
    project     = "examen"
    org         = "utvt"
    managed_by  = "terraform"
  }
}
