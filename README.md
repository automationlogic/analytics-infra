# Analytics Infra

## Overview

Creates the Analytics project and all related infrastructure resources such as Pub/Sub topics and subscriptions, and BigQuery datasets.

Creates pipeline triggers for downstream services and apps, as configured in `terraform.tfvars` (see [Configuration] (https://github.com/thundercomb/analytics-infra#Configuration) section).

## Prerequisites

The [platform-inception](https://github.com/thundercomb/platform-inception) repo must run before this repo.

## Configuration

Create the `terraform.tfvars` file in `infra/tfvars`. See `terraform.tfvars.example` for example values.

`repos` : Ingestion and serving repo(s)  
`training_repos` : Machine learning training repo(s)  
`security_repos` : Security controls repo(s)  
`topics` : Pub/Sub topic(s)  
`subscriptions` : Pub/Sub subscription(s)  
`datasets` : BigQuery dataset(s)  

## Run

The Analytics Infra pipeline resides in the Inception project. It triggers automatically when code is pushed. It can also be triggered manually via the GCP Console.
