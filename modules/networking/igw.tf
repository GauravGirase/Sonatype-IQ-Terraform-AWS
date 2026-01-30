resource "aws_internet_gateway" "iq_igw" {
  vpc_id = aws_vpc.iq_vpc.id

  tags = {
    Name        = "ref-arch-iq-igw"
  }
}