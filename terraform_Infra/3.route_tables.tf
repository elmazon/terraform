####################### ROUTE TABLES #######################
####### PRIVATE ROUTE #######
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.name_tag}-${var.env}-private_rt"
  }
}






####### PRIVATE ROUTE WITH NAT######
resource "aws_eip" "lb" {
  vpc      = true
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.public1.id

  tags = {
    Name = "${var.name_tag}-${var.env}-nat"
  }
  depends_on = [aws_internet_gateway.gw]
}



resource "aws_route_table" "privatenat" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
  tags = {
    Name = "${var.name_tag}-${var.env}-privatnat_rt"
  }
}  
  
  
  
  
  
####### PUBLIC ROUTE ####### 
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.name_tag}-${var.env}-igw"
  }
}



resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "${var.name_tag}-${var.env}-public_rt"
  }
}





##################################### ROUTE TABLE ASSOCIATION ##################################### 

####### PUBLIC ROUTE TABLE ASSOCIATION TO PUBLIC SUBNETS ####### 
resource "aws_route_table_association" "publicas1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "publicas2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public.id
}



######## PRIVATE ROUTE TABLE ASSOCIATION ######## 
resource "aws_route_table_association" "privateas1" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.privatenat.id
}

resource "aws_route_table_association" "privateas2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.privatenat.id
}
