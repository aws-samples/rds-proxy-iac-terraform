data "aws_subnet_ids" "rds_proxy_subnets" {
  vpc_id = var.vpc_id
  tags = var.vpc_subnet_filter_tag
}

data "aws_iam_role" "rds_proxy_role" {
  name = var.rds_proxy_role
}

data "aws_security_groups" "rds_security_groups" {
  filter {
    name   = "group-name"
    values = [var.rds_security_group_name]
  }

  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}

data "aws_secretsmanager_secret" "rds_secret" {
  name = var.rds_secret_name
}