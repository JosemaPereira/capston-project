variable "region" {
  description = "AWS Deployment region.."
}

### Networking ###
variable "vpc_cidr" {
  type        = string
  description = "IP Ranges for the VPC"
}

variable "public_subnets_cidr" {
  type        = list(string)
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

### S3 ###
variable "bucket_prefix" {
  description = "A prefix will be added to a random name"
  type        = string
}

variable "acl" {
  description = "Access Control List"
  type        = string
}

variable "versioning" {
  description = "Version of the stored object"
  type        = bool
}

### RDS ###
variable "allocated_storage" {
  description = "Space in disk for the database, stay in the range 5-10 to stay in free tier"
}
variable "db_engine" {
  description = "Database instance type"
}
variable "db_port"{
  description = "Database port"
}
variable "engine_version" {
  description = "Engine version"
}
variable "instance_type" {
  description = "Type for the rds instance, set db.t3.micro to stay in the free tier"
}
variable "database_name" {
  description = "Name for the rds database"
}
variable "db_username" {
  description = "Username credentials for root user"
}
variable "db_password" {
  description = "Password credentials for root user"
}
variable "publicly_accessible" {
  description = "Variable that set the instance to be accessible publicly"
}