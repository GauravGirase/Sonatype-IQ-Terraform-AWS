resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = {
    Name        = "ref-arch-nat-eip"
  }
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnets[0].id # Single NAT gateway

  tags = {
    Name        = "ref-arch-nat-gateway"
  }

  depends_on = [aws_internet_gateway.iq_igw]
}