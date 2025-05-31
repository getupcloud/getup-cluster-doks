# File auto-generated from ./bin/outputs

output "doks_cluster_name" {
  description = "The name of the EKS cluster"
  value       = module.doks.doks_cluster_name
}

output "doks_cluster_id" {
  description = "A unique ID that can be used to identify and reference a Kubernetes cluster."
  value       = module.doks.doks_cluster_id
}

output "doks_region" {
  description = "DigitalOcean Region."
  value       = module.doks.doks_region
}

output "doks_cluster_endpoint" {
  description = "The base URL of the API server on the Kubernetes master node."
  value       = module.doks.doks_cluster_endpoint
}

output "doks_kubeconfig" {
  description = "A representation of the Kubernetes cluster's kubeconfig."
  value       = module.doks.doks_kubeconfig
  sensitive   = true
}

output "doks_node_pool" {
  description = "Cluster's default node pool attributes."
  value       = module.doks.doks_node_pool
}

output "doks_cluster_urn" {
  description = "The uniform resource name (URN) for the Kubernetes cluster."
  value       = module.doks.doks_cluster_urn
}

output "doks_ipv4_address" {
  description = "The public IPv4 address of the Kubernetes master node. This will not be set if high availability is configured on the cluster."
  value       = module.doks.doks_ipv4_address
}

output "doks_cluster_vpc_uuid" {
  description = "UUID of the cluster VPC"
  value       = module.doks.doks_cluster_vpc_uuid
}
