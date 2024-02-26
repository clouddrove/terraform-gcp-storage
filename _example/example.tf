provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
  zone    = var.gcp_zone
}

module "bucket_logs" {
  source = "../"

  name               = "storage-bucket"
  environment        = "test-log-bukcet"
  label_order        = ["name", "environment"]
  project_id         = "clouddrove"
  location           = "US"
  bucket_iam_members = ["user:example@example.com"]

}

module "bucket" {
  source = "../"

  name        = "storage-bucket"
  environment = "test-main-bukcet"
  label_order = ["name", "environment"]


  location                                 = "US"
  project_id                               = "clouddrove"
  google_storage_bucket_iam_member_enabled = true
  bucket_id                                = module.bucket.bucket.id
  bucket_iam_members                       = ["user:example@clouddrove.com"]



  #website
  website = {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }

  #logging
  logging = {
    log_bucket        = module.bucket_logs.bucket.id
    log_object_prefix = "gcs-log"
  }

  #cors
  cors = [{
    origin          = ["http://image-store.com"]
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    response_header = ["*"]
    max_age_seconds = 3600
  }]

  # versioning
  versioning = true

  #lifecycle_rules
  lifecycle_rules = [{
    action = {
      type          = "SetStorageClass"
      storage_class = "NEARLINE"
    }
    condition = {
      age                        = 60
      created_before             = "2018-08-20"
      with_state                 = "LIVE"
      matches_storage_class      = ["STANDARD"]
      num_newer_versions         = 10
      custom_time_before         = "1970-01-01"
      days_since_custom_time     = 1
      days_since_noncurrent_time = 1
      noncurrent_time_before     = "1970-01-01"
    }
  }]
}