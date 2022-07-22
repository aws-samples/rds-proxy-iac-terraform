provider "aws" {
  region  = var.aws_region
}

resource "aws_db_proxy" "this" {
  name                   = var.rds_instance_id
  debug_logging          = false
  engine_family          = "POSTGRESQL"
  idle_client_timeout    = 1800
  require_tls            = true
  role_arn               = data.aws_iam_role.rds_proxy_role.arn
  vpc_security_group_ids = data.aws_security_groups.rds_security_groups.ids
  vpc_subnet_ids         = data.aws_subnet_ids.rds_proxy_subnets.ids

  auth {
    auth_scheme = "SECRETS"
    description = "using secret manager"
    iam_auth    = "DISABLED"
    secret_arn  = data.aws_secretsmanager_secret.rds_secret.arn
  }

  tags = var.rds_proxy_tags
}

resource "aws_db_proxy_default_target_group" "this" {
  db_proxy_name = aws_db_proxy.this.name

  connection_pool_config {
    connection_borrow_timeout    = 120
    max_connections_percent      = 100
    max_idle_connections_percent = 50
  }
}

resource "aws_db_proxy_target" "this" {
  db_instance_identifier = var.rds_instance_id
  db_proxy_name          = aws_db_proxy.this.name
  target_group_name      = aws_db_proxy_default_target_group.this.name
}

