resource "aws_route_table_association" "pri-assoc-1" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private-route.id
}
resource "aws_route_table_association" "pri-assoc-2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private-route.id
}
resource "aws_route_table_association" "pub-assoc-1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public-route.id
}
resource "aws_route_table_association" "pub-assoc-2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public-route.id
}