variable "organization_id" {}
variable "folder_name" {}
variable "permissions" {
  type    = map(list(string))
  default = null
}

module "folder" {
  source = "../"
  folder = {
    name = var.folder_name
  }
  organization_id = var.organization_id
  permissions     = var.permissions
}

output "folder_name" {
  value = module.folder.name
}