output "id" {
  value       = module.storage.*.id
  description = "The ID of the s3 bucket."
}