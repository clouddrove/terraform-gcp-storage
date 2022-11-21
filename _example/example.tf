provider "google" {
  project     = var.gcp_project_id
  credentials = var.gcp_credentials
  region      = var.gcp_region
  zone        = var.gcp_zone
}

module "storage" {
  source = "../"

  name        = "dev_storage"
  environment = var.environment
  label_order = var.label_order

  project_id                        = "clouddrove"
  google_storage_bucket_enabled     = true
  versioning_enabled                = false
  google_storage_bucket_acl_enabled = true
}