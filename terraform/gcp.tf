# Pre-requisites:
# 1. Create a GCP project
# 2. Create a Cloud Storage bucket in the project (pay attention to the location of the bucket, it should be the same as the location of the cluster)

module "data-plane-gcp" {
  source                    = "iomete/iomete-data-plane/gcp"
  version                   = "1.9.0"

  # A unique cluster name for IOMETE. It should be unique within GCP project and compatible with GCP naming conventions (See: https://cloud.google.com/compute/docs/naming-resources)
  cluster_name              = "iomete-community"

  # Google Cloud project ID. This is a unique identifier for your project and can be found in the Google Cloud Console. Recommended to create a new project for IOMETE.
  project_id                    = "project-id"

  # The region where the cluster and Cloud storage will be hosted
  location     = "us-central1"

  # The zone where the cluster will be hosted?
  zone = "us-central1-c"

  lakehouse_storage_bucket_name = "iomete-bucket"
}
