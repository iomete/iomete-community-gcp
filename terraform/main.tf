# Pre-requisites:
# 1. Create a GCP project. See: https://cloud.google.com/resource-manager/docs/creating-managing-projects
# 2. Create a Cloud Storage bucket in the project (pay attention to the location of the bucket, it should be the same as the location of the cluster)

module "iomete-data-plane" {
  source  = "iomete/iomete-data-plane/gcp"
  version = "1.0.0"

  # A unique cluster name for IOMETE. It should be unique within GCP project and compatible with GCP naming conventions (See: https://cloud.google.com/compute/docs/naming-resources)
  cluster_name = "<cluster-name>"

  # Google Cloud project ID. This is a unique identifier for your project and can be found in the Google Cloud Console. Recommended to create a new project for IOMETE.
  project_id = "<your-gcp-project-id>"

  # The region where the cluster and Cloud storage will be hosted
  location = "<gcp-region, e.g. us-central1>"

  # The zone where the cluster will be hosted?
  zone = "<gcp-zone, e.g. us-central1-a>"

  # Create a new Bucket in your project and provide the name here
  lakehouse_storage_bucket_name = "<your-bucket-name>"
}

output "gke_connection_command" {
  value = module.iomete-data-plane.gke_connection_command
}