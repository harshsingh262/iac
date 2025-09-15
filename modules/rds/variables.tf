variable "name" { type = string }
variable "subnet_ids" { type = list(string) }
variable "allocated_storage" { type = number }
variable "engine" { type = string }
variable "engine_version" { type = string }
variable "instance_class" { type = string }
variable "db_name" { type = string }
variable "username" { type = string }
variable "password" { type = string, sensitive=true }
variable "security_group_ids" { type = list(string) }
