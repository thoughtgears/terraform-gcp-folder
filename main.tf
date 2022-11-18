locals {
  parent = var.folder.parent_folder != null ? "folders/${var.folder.parent_folder}" : "organizations/${var.organization_id}"
}

resource "google_folder" "this" {
  display_name = var.folder.name
  parent       = local.parent
}

resource "google_folder_iam_binding" "this" {
  for_each = var.permissions != null ? var.permissions : {}
  folder   = google_folder.this.folder_id
  members  = each.value
  role     = each.key
}