/*
Strcuture:

<Public>
route-table
associated subnet

<Private>
route-table
associated subnet

<Db>
route-table
associated subnet

*/

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.iq_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.iq_igw.id
  }

  tags = {
    Name        = "ref-arch-public-route-table"
  }
}

resource "aws_route_table_association" "public_rta" {
  count          = length(aws_subnet.public_subnets)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.iq_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name        = "ref-arch-private-route-table"
  }
}

resource "aws_route_table_association" "private_rta" {
  count          = length(aws_subnet.private_subnets)
  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private_rt.id
}


resource "aws_route_table" "db_rt" {
  vpc_id = aws_vpc.iq_vpc.id

  tags = {
    Name        = "ref-arch-db-route-table"
  }
}


resource "aws_route_table_association" "db_rta" {
  count          = length(aws_subnet.db_subnets)
  subnet_id      = aws_subnet.db_subnets[count.index].id
  route_table_id = aws_route_table.db_rt.id
}