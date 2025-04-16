
resource "aws_lb" "load_blancer_ashraf" {
  name               = var.lb_name
  internal           = var.Is_private
  load_balancer_type = "application"
  security_groups    = [var.lb_sg_id]
  subnets            = var.public_subnets

  tags = {
    Name = var.lb_name
  }
}

resource "aws_lb_target_group" "this" {
  name     = var.tg_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 10
    matcher             = "200"
  }

  tags = {
    Name = var.tg_name
  }
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.load_blancer_ashraf.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

resource "aws_lb_target_group_attachment" "backend" {
  count            = length(var.backend_instance_ids)
  target_group_arn = aws_lb_target_group.this.arn
  target_id        = var.backend_instance_ids[count.index]
  port             = 80
}
