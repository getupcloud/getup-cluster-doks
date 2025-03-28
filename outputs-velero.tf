# File auto-generated from ./bin/outputs

output "velero_bucket_name" {
  description = "Velero Bucket name."
  value       = module.velero.velero_bucket_name
}

output "velero_access_key" {
  description = "Velero Access Key ID."
  value       = module.velero.velero_access_key
}

output "velero_secret_key" {
  description = "Velero Secret Key."
  value       = module.velero.velero_secret_key
  sensitive   = true
}
