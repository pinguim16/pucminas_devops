
# Criação da VPC
resource "aws_vpc" "vpc_teste_pucminas" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "vpc_teste_pucminas"
  }
}

# Criação da Subnet Pública
resource "aws_subnet" "subnet_teste_pucminas" {
  vpc_id     = aws_vpc.vpc_teste_pucminas.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet_teste_pucminas"
  }
}

# Criação do Internet Gateway
resource "aws_internet_gateway" "internet_gateway_teste_pucminas" {
  vpc_id = aws_vpc.vpc_teste_pucminas.id

  tags = {
    Name = "internet_gateway_teste_pucminas"
  }
}

# Criação da Tabela de Roteamento
resource "aws_route_table" "route_table_teste_pucminas" {
  vpc_id = aws_vpc.vpc_teste_pucminas.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway_teste_pucminas.id
  }

  tags = {
    Name = "route_table_teste_pucminas"
  }
}

# Criação da Rota Default para Acesso à Internet
resource "aws_route" "route_teste_pucminas" {
  route_table_id            = aws_route_table.route_table_teste_pucminas.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.internet_gateway_teste_pucminas.id
}

# Associação da Subnet Pública com a Tabela de Roteamento
resource "aws_route_table_association" "route_table_association_teste_pucminas" {
  subnet_id      = aws_subnet.subnet_teste_pucminas.id
  route_table_id = aws_route_table.route_table_teste_pucminas.id
}