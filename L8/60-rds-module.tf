module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "6.0.0"
  # The name of the RDS instance
  identifier = var.identifier

  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  allocated_storage = 5

  db_name  = var.db_name
  username = var.username
  port     = var.port
  password = var.db_password

  storage_encrypted = false
  multi_az          = false

  vpc_security_group_ids = [module.rds_security_group.security_group_id]

  # maintenance_window = "Mon:00:00-Mon:03:00"
  # backup_window      = "03:00-06:00"
  # enabled_cloudwatch_logs_exports = ["general"]
  # backup_retention_period = 0

  # Enhanced Monitoring - see example for details on how to create the role
  # by yourself, in case you don't want to create it automatically
  # monitoring_interval    = "30"
  # monitoring_role_name   = "MyRDSMonitoringRole"
  # create_monitoring_role = true

  tags = local.common_tags

  # DB subnet group
  create_db_subnet_group = true
  subnet_ids             = module.vpc.database_subnets

  # DB parameter group
  family = var.family

  # DB option group
  major_engine_version = var.major_engine_version

  # Database Deletion Protection
  deletion_protection = var.deletion_protection
  # For deleting Opiton Group
  skip_final_snapshot = true
  parameters          = var.parameters

  options = var.options
}