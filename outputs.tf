output "PUBLIC_LB_ARN" {
  value = aws_lb.public.arn
}

output "PRIVATE_LB_ARN" {
  value = aws_lb.private.arn
}

output "PRIVATE_LISTENER_ARN" {
  value = aws_lb_listener.private.arn
}