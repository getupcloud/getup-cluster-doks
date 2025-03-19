# File auto-generated from ./bin/outputs

output "cluster_name" {
  description = "The name of the EKS cluster"
  value       = module.doks.cluster_name
}

output "cluster_id" {
  description = "A unique ID that can be used to identify and reference a Kubernetes cluster."
  value       = module.doks.cluster_id
}

output "region" {
  description = "DigitalOcean Region."
  value       = module.doks.region
}

output "cluster_endpoint" {
  description = "The base URL of the API server on the Kubernetes master node."
  value       = module.doks.cluster_endpoint
}

output "kubeconfig" {
  description = "A representation of the Kubernetes cluster's kubeconfig."
  value       = module.doks.kubeconfig
}

output "node_pool" {
  description = "Cluster's default node pool attributes."
  value       = module.doks.node_pool
}

output "cluster_urn" {
  description = "The uniform resource name (URN) for the Kubernetes cluster."
  value       = module.doks.cluster_urn
}

output "ipv4_address" {
  description = "The public IPv4 address of the Kubernetes master node. This will not be set if high availability is configured on the cluster."
  value       = module.doks.ipv4_address
}

output "cluster_vpc_uuid" {
  description = "UUID of the cluster VPC"
  value       = module.doks.cluster_vpc_uuid
}
