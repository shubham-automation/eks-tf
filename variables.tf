variable "region" {
  type        = string
  description = "AWS Region"
  default = "us-east-1"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
  default = "vpc-061809683022da41d"
}

variable "eks_cluster_version" {
  type        = string
  default     = "1.25"
  description = "Desired Kubernetes master version. If you do not specify a value, the latest available version is used"
}

variable "subnet_ids" {
  type        = list(string)
  description = "A list of subnet ID's"
  default = ["subnet-077c877941a79a343","subnet-0aa315341c5c13664"]
}

variable "endpoint_public_access" {
  type        = bool
  default     = true
  description = "Whether to enable EKS public access"
}

variable "endpoint_private_access" {
  type        = bool
  default     = false
  description = "Whether to enable EKS private access"
}

variable "create_security_group" {

  type = bool
  default = false
  description = "Whether to create security group. NOTE: This is for unmanaged EKS workers."
}

variable "apply_config_map_aws_auth" {
  type = bool
  default = false
  description = "Whether to apply aws-auth configmap"
}

variable "instance_types" {
  type        = list(string)
  description = "A list of EKS worker types. eg: t2.medium"
  default = ["t3a.medium"]
}

variable "instance_desired_size" {
  type        = string
  default     = "2"
  description = "Desired EKS worker count"
}

variable "instance_min_size" {
  type        = string
  default     = "2"
  description = "Minimum EKS worker count"
}

variable "instance_max_size" {
  type        = string
  default     = "2"
  description = "Maximum EKS worker count"
}

variable "tags" {
  type        = map(string)
  default     = { 
    Name = "MSKCC-Cluster" 
  }
  description = "Tags for EKS cluster"
}

variable "eks_cluster_name" {
  type        = list(string)
  description = "EKS Cluster Name"
  default = ["mskcc"]
}