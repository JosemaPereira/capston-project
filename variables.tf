variable "region" {
  description = "AWS Deployment region.."
}

### Networking ###
variable "vpc_cidr" {
  type        = string
  description = "IP Ranges for the VPC"
}

variable "public_subnets_cidr" {
  type        = string
  description = "IP Ranges for the Public Subnet"
}

variable "private_subnets_cidr" {
  type        = list(string)
  description = "IP Ranges for the Private Subnet"
}

variable "availability_zone" {
  type = list(string)
  description = "AZ for Private Subnets"
}

### eks ###
variable "cluster_name" {
  description = "The name of the Airflow cluster (e.g. airflow-xyz). This variable is used to namespace all resources created by this module."
  type        = string
}

variable "cluster_version" {
  default     = "1.20"
  description = "Cluster version"
}

variable "instance_type_group1" {
  default     = "t2.micro"
  description = "Instance type for the group 1"
}

variable "instance_type_group2" {
  default     = "t2.micro"
  description = "Instance type for the group 2"
}

variable "asg_desired_capacity_group1" {
  default     = 1
  description = "Desired capacity for autoscaling for the group 1"
}

variable "asg_desired_capacity_group2" {
  default     = 1
  description = "Desired capacity for autoscaling for the group 2"
}