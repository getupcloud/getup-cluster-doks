provider "digitalocean" {
  token = var.do_token
}

provider "kubernetes" {
  host                   = module.doks.doks_kubeconfig.host
  cluster_ca_certificate = base64decode(module.doks.doks_kubeconfig.cluster_ca_certificate)
  token                  = module.doks.doks_kubeconfig.token
  client_certificate     = module.doks.doks_kubeconfig.client_certificate
  client_key             = module.doks.doks_kubeconfig.client_key
}

provider "helm" {
  kubernetes {
    host                   = module.doks.doks_kubeconfig.host
    cluster_ca_certificate = base64decode(module.doks.doks_kubeconfig.cluster_ca_certificate)
    token                  = module.doks.doks_kubeconfig.token
    client_certificate     = module.doks.doks_kubeconfig.client_certificate
    client_key             = module.doks.doks_kubeconfig.client_key
  }
}

provider "flux" {
  kubernetes = {
    host                   = module.doks.doks_kubeconfig.host
    cluster_ca_certificate = base64decode(module.doks.doks_kubeconfig.cluster_ca_certificate)
    token                  = module.doks.doks_kubeconfig.token
    client_certificate     = module.doks.doks_kubeconfig.client_certificate
    client_key             = module.doks.doks_kubeconfig.client_key
  }

  git = {
    url = "ssh://git@github.com/${var.flux_github_org}/${var.flux_github_repository}.git"
    ssh = {
      username    = "git"
      private_key = module.flux.private_key_pem
    }
  }
}

provider "github" {
  owner = var.flux_github_org
  token = var.flux_github_token
}
