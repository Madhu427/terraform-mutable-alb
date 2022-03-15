resource "aws_lb" "public" {
  name               = "${ENV}-public-alb"
  internal           = false
  load_balancer_type = "application"
#  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = data.terraform_remote_state.vpc.outputs.PUBLIC_SUBNETS

  tags = {
    Environment = "${ENV}-public-alb"
  }
}

resource "aws_lb" "private" {
  name               = "${ENV}-private-tf"
  internal           = true
  load_balancer_type = "application"
#  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNETS


  tags = {
    Environment = "${ENV}-private-tf"
  }
}