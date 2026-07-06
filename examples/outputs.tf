output "bucket_location" {
  description = "Bucket location"
  value       = module.bucket.bucket.location
}

output "bucket_storage_class" {
  description = "Bucket storage class"
  value       = module.bucket.bucket.storage_class
}

output "bucket_project" {
  description = "Project ID"
  value       = module.bucket.bucket.project
}