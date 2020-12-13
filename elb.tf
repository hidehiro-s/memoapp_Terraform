resource "aws_lb" "memoapp_elb" {
  name                       = "memoapp-elb"
  load_balancer_type         = "application"
  internal                   = false
  idle_timeout               = 60
  enable_deletion_protection = false

  subnets = [
    aws_subnet.subnetaz1a.id,
    aws_subnet.subnetaz1c.id
  ]

  security_groups = [
    aws_security_group.ec2.id
  ]
}
resource "aws_lb_target_group" "elb" {
  name                 = "memoapp-elb-target-group"
  vpc_id               = aws_vpc.memoapp_vpc.id
  #target_type          = "ip"
  port                 = 80
  protocol             = "HTTP"
  deregistration_delay = 300

  health_check {
    path                = "/"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 10
    matcher             = 200
    port                = "traffic-port"
    protocol            = "HTTP"
  }
}
resource "aws_lb_listener" "elb" {
  load_balancer_arn = aws_lb.memoapp_elb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.elb.arn
    type             = "forward"
    }
  }

resource "aws_lb_target_group_attachment" "memoapp" {
  target_group_arn = aws_lb_target_group.elb.arn
  target_id        = aws_instance.EC2.id
  port             = 80
}