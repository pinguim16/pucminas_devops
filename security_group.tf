# Security Group
resource "aws_security_group" "sg-web" {
  name        = "${local.prefix}-sg-web"
  description = "Security Group para acesso SSH e HTTP"
  vpc_id      = aws_vpc.vpc_teste_pucminas.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${local.prefix}-sg"
    }
  )
}
