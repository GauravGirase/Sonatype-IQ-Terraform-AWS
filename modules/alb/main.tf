resource "aws_lb" "iq_alb" {
    name = "ref-arch-iq-alb"
    internal = false
    load_balancer_type = "application"
    security_groups = [aws_security_group_alb_id]
    subnets = var.public_subnets

    enable_deletion_protection = var.alb_deletion_protection

    access_logs {
      bucket = var.aws_s3_bucket_alb_logs_bucket
      prefix = "alb-logs"
      enabled = true
    }

    tags = {
        Name        = "ref-arch-iq-alb"
    }
}

resource "aws_lb_target_group" "iq_tg" {
  name = "ref-arch-iq-tg"
  port = 8070
  protocol = "HTTP"
  vpc_id = var.vpc_id
  target_type = "ip"

  health_check {
    enabled = true
    healthy_threshold = 2
    interval = 30
    matcher = "200"
    path = "/ping"
    port = "traffic-port"
    protocol = "HTTP"
    timeout = 5
    unhealthy_threshold = 3
  }

  tags = {
    Name        = "ref-arch-iq-target-group"
  }
}

resource "aws_lb_target_group" "iq_admin_tg" {
  name        = "ref-arch-iq-admin-tg"
  port        = 8071
  protocol    = "HTTP"
  vpc_id      = aws_vpc.iq_vpc.id
  target_type = "ip"

  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 30
    matcher             = "200,404"
    path                = "/healthcheck"
    port                = "8071"
    protocol            = "HTTP"
    timeout             = 15
    unhealthy_threshold = 3
  }

  tags = {
    Name        = "ref-arch-iq-admin-target-group"
  }
}

resource "aws_lb_listener" "iq_listener" {
  load_balancer_arn = aws_lb.iq_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.iq_tg.arn
  }
}