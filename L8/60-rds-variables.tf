variable "identifier" {
  type    = string
  default = "testdb"
}
variable "instance_class" {
  type    = string
  default = "db.t3.large"
}
variable "engine" {
  type    = string
  default = "mysql"

}
variable "engine_version" {
  type    = string
  default = "5.7"
}
variable "allocated_storage" {
  type    = string
  default = 5

}
variable "db_name" {
  type    = string
  default = "test-db"
}
variable "username" {
  type    = string
  default = "pmbibe"
}
variable "db_password" {
  type      = string
  sensitive = true
}
variable "port" {
  type    = string
  default = 3306
}
variable "family" {
  type    = string
  default = "mysql5.7"
}
variable "major_engine_version" {
  type    = string
  default = "5.7"

}
variable "deletion_protection" {
  type    = bool
  default = true

}
variable "parameters" {
  type    = list(map(string))
  default = []
}
variable "options" {
  type    = any
  default = []
}
