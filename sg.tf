resource "aws_security_group" "public_lb" {
  name        = "${var.ENV}-public-lb"
  description = "for public ALB"
  vpc_id      = data.terraform_remote_state.vpc.outputs.VPC_ID

  ingress {
    description      = "HTTP Traffic"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  tags = {
    Name = "${var.ENV}-public-lb"
  }
}

resource "aws_security_group" "private_lb" {
  name        = "${var.ENV}-private-lb"
  description = "for private ALB"
  vpc_id      = data.terraform_remote_state.vpc.outputs.VPC_ID

  ingress {
    description      = "HTTP Traffic"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNET_CIDR
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  tags = {
    Name = "${var.ENV}-private-lb"
  }
}