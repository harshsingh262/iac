resource "aws_db_subnet_group" "this" {
  name = "${var.name}-db-subnet-group"
  subnet_ids = var.subnet_ids
  tags = { Name = "${var.name}-db-subnet-group" }
}

resource "aws_db_instance" "this" {
  identifier = "${var.name}-db"
  allocated_storage = var.allocated_storage
  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  name              = var.db_name
  username          = var.username
  password          = var.password
  db_subnet_group_name = aws_db_subnet_group.this.name
  skip_final_snapshot = true
  publicly_accessible = false
  vpc_security_group_ids = var.security_group_ids
  tags = { Name = "${var.name}-rds" }
}

output "endpoint" { value = aws_db_instance.this.endpoint }
output "address" { value = aws_db_instance.this.address }
