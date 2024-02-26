# Infrastructure Setup with Terraform

This repository contains Terraform configuration files for setting up infrastructure on [Google Cloud Platform (GCP)](https://cloud.google.com/) using Terraform.

## Prerequisites

Before you begin, make sure you have the following prerequisites installed and configured:

1. **Terraform**: Install Terraform by following the instructions [here](https://learn.hashicorp.com/tutorials/terraform/install-cli).
2. **Google Cloud Platform Account**: You need a GCP account to create resources. If you don't have one, sign up [here](https://cloud.google.com/).
3. **Service Account**: Create a service account and download the JSON key file. This service account should have sufficient permissions to create and manage resources on GCP. Refer to the [official documentation](https://cloud.google.com/iam/docs/creating-managing-service-accounts) for instructions.
4. **Authentication**: Authenticate Terraform with GCP using the service account key file. You can do this by setting the `GOOGLE_APPLICATION_CREDENTIALS` environment variable to the path of the JSON key file.

- gcloud auth application-default login 
- gcloud auth application-default revoke

## Setup Instructions

Follow these steps to set up the infrastructure using Terraform:

1. **Clone the Repository**:

    ```bash
    git clone git@github.com:Sourabh-Kumar7/tf-gcp-infra.git
    ```

2. **Change Directory**:

    ```bash
    cd tf-gcp-infra/terraform
    ```

3. **Initialize Terraform**:

    ```bash
    terraform init
    ```

4. **Review Configuration and Validate Terraform**:

    Review the `variables.tfvars` file and update the variables with appropriate values for your environment.
    ```bash
    terraform validate
    ```

5. **Plan the Deployment**:

    ```bash
    terraform plan -var-file="variables.tfvars"
    ```

    This step will show you the execution plan without actually deploying the infrastructure.

6. **Deploy Infrastructure**:

    ```bash
    terraform apply -var-file="variables.tfvars"
    ```

    Confirm the deployment by typing `yes` when prompted.

7. **Verify Deployment**:

    After Terraform has finished applying changes, verify that the infrastructure has been created as expected in your GCP console.

8. **Destroy Infrastructure (Optional)**:

    If you want to tear down the infrastructure, you can do so by running:

    ```bash
    terraform destroy
    ```

    Confirm the destruction by typing `yes` when prompted.


## Enabled GCP APIs

- BigQuery API
- BigQuery Migration API
- BigQuery Storage API
- Cloud Datastore API
- Cloud Logging API
- Cloud Monitoring API
- Cloud SQL
- Cloud Storage
- Cloud Storage API
- Cloud Trace API
- Google Cloud APIs
- Google Cloud Storage JSON API
- Service Management API
- Service Usage API
- Compute Engine API
- Cloud SQL Admin API
- Service Networking API

## Networking Setup

### Virtual Private Cloud (VPC)
- **Name**: my-vpc
- **Auto-create Subnets**: Disabled
- **Routing Mode**: Regional
- **Default Routes**: No default routes created

### Subnets
- **Webapp Subnet**:
  - **Name**: webapp-subnet
  - **CIDR Range**: 10.1.0.0/24
  - **Purpose**: Subnet for hosting the web application.
- **Database (DB) Subnet**:
  - **Name**: db-subnet
  - **CIDR Range**: 10.2.0.0/24
  - **Purpose**: Subnet for hosting the database.

### Routes
- **Webapp Route**:
  - **Destination**: 0.0.0.0/0
  - **Next Hop**: Internet Gateway
  - **Priority**: 1000
  - **Tags**: webapp


## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, feel free to open an issue or create a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
