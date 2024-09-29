# main.tf

provider "aws" {
  region = "us-east-1"
}


resource "aws_db_instance" "tech_challenge_db" {
  allocated_storage = 20
  engine            = "postgres"
  engine_version    = "13.4"
  instance_class    = var.db_instance_class

  username             = "admin"
  password             = "P@ssw0rd!"
  parameter_group_name = "default.postgres13"
  skip_final_snapshot  = true


}

