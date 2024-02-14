# tf-gcp-infra

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
  - **Next Hop Ip**: webapp-subnet Ip
  - **Priority**: 1000
  - **Tags**: webapp
