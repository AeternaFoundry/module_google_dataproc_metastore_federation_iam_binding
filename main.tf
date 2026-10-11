resource "google_dataproc_metastore_federation_iam_binding" "dataproc_metastore_federation_iam_bindings" {
  for_each = var.dataproc_metastore_federation_iam_bindings

  federation_id = each.value.federation_id
  members       = each.value.members
  role          = each.value.role
  location      = each.value.location
  project       = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

