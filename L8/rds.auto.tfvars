identifier = "staging-db"

engine            = "mysql"
engine_version    = "5.7"
instance_class    = "db.t2.micro"
allocated_storage = 5

db_name     = "stagingdb"
username    = "pmbibe"
port        = "3306"
family      = "mysql5.7"
db_password = "dbpassword11"
# DB option group
major_engine_version = "5.7"
deletion_protection  = false

parameters = [
  {
    name  = "character_set_client"
    value = "utf8mb4"
  },
  {
    name  = "character_set_server"
    value = "utf8mb4"
  }
]

options = [
  {
    option_name = "MARIADB_AUDIT_PLUGIN"

    option_settings = [
      {
        name  = "SERVER_AUDIT_EVENTS"
        value = "CONNECT"
      },
      {
        name  = "SERVER_AUDIT_FILE_ROTATIONS"
        value = "37"
      },
    ]
  },
]