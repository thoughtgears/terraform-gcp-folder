variable "folder" {
  type = object({
    name          = string
    parent_folder = optional(string)
  })
  description = <<-EOF
  An object for the folder:
  name = string
  parent_folder = folder_id

  If the parent folder is not present, it will use the organization as a part and put it at the top level of the organization
  EOF

  validation {
    condition     = length(split("folders/", coalesce(var.folder.parent_folder, " "))) == 1 && length(split("folders/", coalesce(var.folder.parent_folder, " "))) == 1
    error_message = "You must use the raw id, meaning without prefix 'folders/'."
  }
}

variable "organization_id" {
  type        = string
  description = "Google Cloud Platform Organization ID"

  # Ensures that we only use the raw organization ID
  validation {
    condition     = length(split("organizations/", coalesce(var.organization_id, " "))) == 1 && length(split("organization/", coalesce(var.organization_id, " "))) == 1
    error_message = "You must use the raw id, meaning without prefix 'organizations/'."
  }

  validation {
    condition     = can(regex("[0-9]", var.organization_id))
    error_message = "Org ID must only contain numeric values"
  }
}

variable "permissions" {
  type        = map(list(string))
  description = "A map of role type with a list of members to set authoritative permissions on the folder"
  default     = null
}