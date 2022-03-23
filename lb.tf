resource "aws_lb" "my-test-lb" {
  name               = "my-test-lb"
  internal           = false
  load_balancer_type = "application"
  ip_address_type    = "ipv4"
  subnets            = ["subnet-073e48861cf2c339f","subnet-05c44ccdc8bb00495"]
  /*security_groups = "sg-0becf897c06cd3dd4"*/

  enable_deletion_protection = false

 
}

resource "aws_lb_target_group" "my-alb-tg" {
  health_check {
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = "200-299"
  }

  name        = "my-alb-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = "vpc-03a65568a160c471c"
  target_type = "instance"
}

resource "aws_lb_target_group_attachment" "my-tg-attachment1" {
  target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:966073711270:targetgroup/albtargetgroup/c95ecdc82caef941"
  target_id        = "i-09219ed792259f71f"
  port             = 80
}

/*resource "aws_lb_target_group_attachment" "my-tg-attachment2" {
  target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:966073711270:targetgroup/nlbTG/45f330e2403e61c9"
  target_id        = "i-09219ed792259f71f"
  port             = 80
}*/

resource "aws_security_group" "security_group" {
  name   = "my-alb-sg"
  vpc_id = "vpc-03a65568a160c471c"
}

resource "aws_security_group_rule" "http_allow" {
  from_port         = 80
  protocol          = "tcp"
  security_group_id = "sg-05a5c5e3f788c9fe8"
  to_port           = 80
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

/*resource "aws_security_group_rule" "all_outbound_access" {
  from_port         = 0
  protocol          = "-1"
  security_group_id = "sg-05a5c5e3f788c9fe8"
  to_port           = 0
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}*/
