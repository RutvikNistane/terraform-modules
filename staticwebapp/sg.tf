resource "aws_security_group" "allow_tls" {
  name        = "${local.key_name}-application-sg"
  description = "My security group"

  dynamic "ingress" {
    for_each = var.ports
    iterator = port
    content {
      description = "HTTP from VPC"
      from_port   = port.value.from_port
      to_port     = try(port.value.to_port, port.value.from_port)
      protocol    = "tcp"
      cidr_blocks = port.value.cidr
    }
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
