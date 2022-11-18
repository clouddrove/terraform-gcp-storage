output "id" {
  description = "GCS bucket id."
  value       = join("", google_storage_bucket.default.*.id)
}

output "name" {
  description = "GCS bucket name."
  value       = join("", google_storage_bucket.default.*.name)
}

output "self_link" {
  description = "URI of the GCS bucket."
  value       = join("", google_storage_bucket.default.*.self_link)
}

output "url" {
  description = "The base URL of the bucket, in the format gs://<bucket-name>"
  value       = join("", google_storage_bucket.default.*.url)
}