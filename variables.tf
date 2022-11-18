variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "label_order" {
  type        = list(any)
  default     = []
  description = "Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] ."
}

variable "name" {
  type    = string
  default = ""
}

variable "bucket_name" {
  type        = string
  default     = ""
  description = "Google Cloud Storage (GCS) bucket Name."
}

variable "project_id" {
  type        = string
  default     = ""
  description = "GCS Project ID."
}

variable "gcs_location" {
  type        = string
  default     = "EU"
  description = "GCS Location."
}

variable "force_destroy" {
  type        = bool
  default     = true
  description = "Delete all objects when deleting bucket."
}

variable "storage_class" {
  description = "(Optional) The Storage Class of the new bucket. Supported values include: STANDARD, MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE, ARCHIVE."
  type        = string
  default     = "STANDARD"

}

variable "versioning_enabled" {
  type        = bool
  default     = false
  description = "Enable GCS Bucket versioning."
}

variable "storage_bucket_enabled" {
  type        = bool
  default     = true
  description = "Flag to control the vpc creation."
}

variable "location" {
  type        = string
  default     = ""
  description = "The location (region or zone) to host the cluster in"

}

variable "bucket_policy" {
  type        = bool
  default     = true
  description = "If true then Bucket Policy Only access is enabled on this bucket. See: https://cloud.google.com/storage/docs/bucket-policy-only."

}

variable "log_bucket" {
  type        = string
  default     = ""
  description = "The name of the bucket to which access logs for this bucket should be written. If this is not supplied then no access logs are written."

}

variable "log_object_prefix" {
  type        = string
  default     = ""
  description = "The prefix for access log objects. If this is not provided then GCS defaults it to the name of the source bucket."

}

variable "kms_key_sl" {
  type        = string
  default     = ""
  description = "A self_link to a Cloud KMS key to be used to encrypt objects in this bucket, see also: https://cloud.google.com/storage/docs/encryption/using-customer-managed-keys. If this is not supplied then default encryption is used."

}

variable "retention_policy_retention_period" {
  type        = string
  default     = ""
  description = "The period of time, in seconds, that objects in the bucket must be retained and cannot be deleted, overwritten, or archived. The value must be less than 3,155,760,000 seconds. If this is supplied then a bucket retention policy will be created."

}

variable "retention_policy_is_locked" {
  type        = bool
  default     = false
  description = "If set to true, the bucket will be locked and any changes to the bucket's retention policy will be permanently restricted. Caution: Locking a bucket is an irreversible action."

}

variable "website_main_page_suffix" {
  type        = string
  default     = ""
  description = "The name of a file in the bucket which will act as the 'index' page to be served by GCS if this bucket is hosting a static website. See also: https://cloud.google.com/storage/docs/hosting-static-website."

}

variable "website_not_found_page" {
  type        = string
  default     = ""
  description = "The name of the 'not found' page to be served by GCS if this bucket is hosting a static website. See also: https://cloud.google.com/storage/docs/hosting-static-website."

}

variable "cors_origins" {
  type        = list(string)
  default     = []
  description = "The list of Origins eligible to receive CORS response headers. Note: '*' is permitted in the list of origins, and means 'any Origin'. See also: https://tools.ietf.org/html/rfc6454."

}

variable "cors_methods" {
  type        = list(string)
  default     = []
  description = "The list of HTTP methods on which to include CORS response headers, (GET, OPTIONS, POST, etc) Note: '*' is permitted in the list of methods, and means 'any method'."

}

variable "cors_response_headers" {
  type        = list(string)
  default     = []
  description = "The list of HTTP headers other than the simple response headers to give permission for the user-agent to share across domains."

}

variable "cors_max_age_seconds" {
  type        = number
  default     = 0
  description = "The value, in seconds, to return in the Access-Control-Max-Age header used in preflight responses."

}

variable "has_cors" {
  type        = bool
  default     = true
  description = "The list of Origins eligible to receive CORS response headers. Note: '*' is permitted in the list of origins, and means 'any Origin'. See also: https://tools.ietf.org/html/rfc6454."

}

variable "default_acl" {
  type        = string
  default     = ""
  description = "The default ACL for the bucket, see: https://cloud.google.com/storage/docs/access-control/lists#predefined-acl."

}

variable "predefined_acl" {
  type        = string
  default     = ""
  description = "One of the canned bucket ACLs, see https://cloud.google.com/storage/docs/access-control/lists#predefined-acl for more details. Must be set if var.role_entity is not."

}

variable "role_entity" {
  type        = list(string)
  default     = []
  description = "List of role/entity pairs in the form ROLE:entity. See https://cloud.google.com/storage/docs/json_api/v1/bucketAccessControls for more details. Must be set if var.predefined_acl is not."

}
variable "module_enabled" {
  type    = bool
  default = true

}

variable "google_storage_bucket_enabled" {
  type    = bool
  default = true
}

variable "google_storage_bucket_acl_enabled" {
  type    = bool
  default = true
}

variable "lifecycle_rules" {
  default     = []
  description = "The lifecycle rules to be applied to this bucket. If this array is populated then each element in it will be applied as a lifecycle rule to this bucket. The structure of each element is described in detail here: https://www.terraform.io/docs/providers/google/r/storage_bucket.html#lifecycle_rule. See also: https://cloud.google.com/storage/docs/lifecycle#configuration."

}