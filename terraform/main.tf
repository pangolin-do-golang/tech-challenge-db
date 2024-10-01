# main.tf

provider "aws" {
  region = "us-east-1"
}

resource "aws_db_subnet_group" "default" {
  name = "main"
  subnet_ids = ["subnet-003555b3ef5b4ea17", "subnet-0ab3604495a3d4aeb", "subnet-0e91caa966025f17f"]
}

resource "aws_db_instance" "tech_challenge_db" {
  db_name              = "tech_challenge"
  allocated_storage    = 10
  engine               = "postgres"
  engine_version       = "16.2"
  instance_class       = "db.t3.micro"
  multi_az             = false
  db_subnet_group_name = aws_db_subnet_group.default.name

  username             = "tech_challenge_user"
  password             = "bXlzZWN1cmVwYXNzd29yZA=="
  parameter_group_name = "default.postgres16"
  skip_final_snapshot  = true
}

