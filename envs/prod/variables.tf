variable "name" { type = string }
variable "vpc_cidr" { type = string }
variable "public_subnets" { type = list(string) }
variable "private_subnets" { type = list(string) }
variable "azs" { type = list(string) }
variable "ami" { type = string }
variable "instance_type" { type = string }
variable "allowed_ssh_cidrs" { type = list(string) }
variable "db_allocated_storage" { type = number }
variable "db_engine" { type = string }
variable "db_engine_version" { type = string }
variable "db_instance_class" { type = string }
variable "db_name" { type = string }
variable "db_username" { type = string }
variable "db_password" { type = string, sensitive=true }
variable "db_security_group_ids" { type = list(string) }
variable "aws_region" { type = string }
