# File auto-generated from ./bin/outputs

output "loki_bucket_name" {
  description = "Loki Bucket name."
  value       = module.loki.loki_bucket_name
}

output "loki_access_key" {
  description = "Loki Access Key ID."
  value       = module.loki.loki_access_key
}

output "loki_secret_key" {
  description = "Loki Secret Key."
  value       = module.loki.loki_secret_key
  sensitive   = true
}
