variable "dataproc_metastore_federation_iam_bindings" {
  description = <<EOT
Map of dataproc_metastore_federation_iam_bindings, attributes below
Required:
    - federation_id
    - members
    - role
Optional:
    - location
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    federation_id = string
    members       = set(string)
    role          = string
    location      = optional(string)
    project       = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

