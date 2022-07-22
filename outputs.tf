output rds_proxy_subnet_ids{
    value = data.aws_subnet_ids.rds_proxy_subnets.ids
}
output rds_proxy_role_arn{
    value = data.aws_iam_role.rds_proxy_role.arn
}
output rds_security_group_ids{
    value = data.aws_security_groups.rds_security_groups.ids
}
output rds_secret_arn{
  value = data.aws_secretsmanager_secret.rds_secret.arn
}
output rds_proxy_endpoint{
    value = aws_db_proxy.this.endpoint
}