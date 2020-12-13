resource "aws_db_parameter_group" "rds" {
  name   = "rds"
  family = "mysql8.0"

  parameter {
    name  = "character_set_database"
    value = "utf8mb4"
  }

  parameter {
    name  = "character_set_server"
    value = "utf8mb4"
  }
}
resource "aws_db_instance" "dbinstance" {
  identifier                 = "memoapp-db"
  engine                     = "mysql"
  engine_version             = "8.0.21"
  instance_class             = "db.t2.micro"
  allocated_storage          = 20
  storage_type               = "gp2"
  storage_encrypted          = false
  #kms_key_id                 = "${aws_kms_key.example.arn}"
  username                   = "root"
  password                   = "password"
  multi_az                   = false
  publicly_accessible        = false
  backup_window              = "15:00-16:00"
  backup_retention_period    = 1
  maintenance_window         = "sun:18:00-sun:19:00"
  auto_minor_version_upgrade = true
  deletion_protection        = false
  skip_final_snapshot        = false
  port                       = 3306
  apply_immediately          = false
  vpc_security_group_ids     = [aws_security_group.rds.id]
  #parameter_group_name       = "${aws_db_parameter_group.example.name}"
  #option_group_name          = "${aws_db_option_group.example.name}"
  db_subnet_group_name       = aws_db_subnet_group.rds.id
}
