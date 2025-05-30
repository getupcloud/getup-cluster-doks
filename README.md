## Requirements

- Terraform >= v1.11
- AWS cli configured
- kubectl
- python3

## Creating a cluster

Run the command below and follow the instructions.

```
curl -OLs https://github.com/getupcloud/getup-cluster-doks/raw/main/create-cluster.sh
bash ./create-cluster.sh
```

## Create terraform state bucket

If you do not already have a bucket to store terraform state, create one using the command below:

```
pip3 install s3cmd --user
s3cmd --configure

### Use config below:
#
#  Access Key:
#  Secret Key:
#  Default Region: US
#  S3 Endpoint: nyc3.digitaloceanspaces.com                                                                 <<--- change for your region
#  DNS-style bucket+hostname:port template for accessing a bucket: %(bucket)s.nyc3.digitaloceanspaces.com   <<--- change for your region
#  Encryption password:                                                                                     <<--- may leave empty
#  Path to GPG program: /usr/bin/gpg                                                                        <<--- may leave empty
#  Use HTTPS protocol: True
#  HTTP Proxy server name:                                                                                  <<-- may leave empty
#  HTTP Proxy server port: 0
###

s3cmd mb s3://CUSTOMER-terraform-state                                                                  <<-- change for desired bucket name

## Setup terraform state backend

Copy the file `versions.tf.example` as `versions.tf`.

```
cp -i versions.tf.example versions.tf
```

Open it and fill the values:

```tf
terraform {
  ...

  backend "s3" {
    endpoints = {
      s3 = "https://${DIGITALOCEAN_REGION}.digitaloceanspaces.com"
    }
    bucket            = "${BUCKET_NAME}"
    key               = "${CLUSTER_NAME}/terraform.tfstate"

    # Deactivate a few AWS-specific checks
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_s3_checksum            = true
    region                      = "us-east-1" # must be us-east-1
  }

  ...
}
```

## Configuring modules

All top-level modules are comprised of the following files:

- `main-${MODULE_NAME}.tf` - The main terraform module. Usually there is only this file with resources/modules;
- `variables-${MODULE_NAME}.tf` - Variables accepted by this module;
- `terraform-${MODULE_NAME}.auto.tfvars.example` - Example tfvars file. Simply copy it removing the `.example` suffix and edit it;
- `outputs-${MODULE_NAME}.tf` - Outputs of this module;
- `moved-${MODULE_NAME}.tf` - Declares `moved` statements for when resources have their names changed. Not all modules have one.

If you are not going to use a specific module, just remove its files.
For exemplo, to remove istio from your stack, execute:

```
$ rm *-istio-*
```
After removing, comment or remove the corresponding entry its `modules.yaml`:

```
$ cat modules.yaml
modules:
- argocd
- cert-manager
- ecr-credentials-sync
- eks
- external-secrets-operator
- external-dns
- flux
#- istio              ## Istio will be ignored
- loki
- opencost
- rds
- tempo
- velero
- vpc_peering
```

In the near future, we will handle this in a more automatic way.


## Main Commands

```
make pull       # pull from git origin
make init       # initializes terraform and validates soource code
make plan       # creates terraform plan on disk
make apply      # applies terraform plan from disk
make overlay    # populates tags `#output:{VAR_NAME}` in ./cluster/overlay/ using values from terraform outputs and tfvars[overlay]
make commit     # create local commit
make push       # push to git origin
```

## Support Commands

```
make help                # print help
make reconcile           # run simple reconcile: clean-output plan apply overlay commit push
make full-reconcile      # run full reconcile: clean-output pull init validate plan apply kubeconfig overlay commit push
make fmt                 # run terraform fmt
make upgrade             # run terraform init --upgrade 
make validate            # run terraform validate 
make kubeconfig          # download the kubeconfig file for kubectl
make output              # run terraform output
make destroy             # destroy kubernetes cluster resources and EKS
make update-version      # update modules versions from remote modules
make show-overlay-vars   # print all overlay vars from ./cluster/overlay
make kustomize|ks        # run kustomize in ./cluster
```
