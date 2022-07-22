variable "aws_account_id" {
  description = "AWS account ID"
  type = string  
}
variable "aws_region" {
  description = "Name of region for deployment"
  type = string  
}
variable "rds_instance_id"{
  description = "Identifier of RDS instance"
  type = string 
}
variable "vpc_id"{
  description = "Identifier of VPC"
  type=string 
}
variable "vpc_subnet_filter_tag"{
  description = "Subnet tag used to select specific subnets in a VPC"
  type=map
}
variable "rds_proxy_role"{
  description = "Role name used by RDS Proxy to access database credentials"
  type = string
}
variable "rds_security_group_name"{
  description = "Security group name for use with RDS Proxy"
  type = string
}
variable "rds_secret_name"{
  description = "Name of the secret in Secrets Manager"
  type=string 
}
variable "rds_proxy_tags"{
  description = "Tags that need applied on RDS Proxy resource"
  type=map
  default={}
}
