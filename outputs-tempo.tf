# File auto-generated from ./bin/outputs

output "tempo_bucket_name" {
  description = "Tempo Bucket name."
  value       = module.tempo.tempo_bucket_name
}

output "tempo_access_key" {
  description = "Tempo Access Key ID."
  value       = module.tempo.tempo_access_key
}

output "tempo_secret_key" {
  description = "Tempo Secret Key."
  value       = module.tempo.tempo_secret_key
  sensitive   = true
}
