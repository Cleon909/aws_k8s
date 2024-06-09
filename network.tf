resource "aws_vpc" "k8s" {
    cidr_block = "10.240.0.0/24"
    enable_dns_hostnames = true
}

resource "aws_subnet" "k8s" {
    vpc_id = aws_vpc.k8s.id
    cidr_block = "10.240.0.0/24"
}

resource "aws_internet_gateway" "k8s" {
    vpc_id = aws_vpc.k8s.id
}

resource "aws_route_table" "k8s" {
    vpc_id = aws_vpc.k8s.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.k8s.id
    }
}

resource "aws_route_table_association" "k8s" {
    subnet_id = aws_subnet.k8s.id
    route_table_id = aws_route_table.k8s.id
}

resource "aws_security_group" "k8s" {
    name = "k8s security group"
    vpc_id = aws_vpc.k8s.id
}

resource "aws_vpc_security_group_ingress_rule" "rule1" {
    security_group_id = aws_security_group.k8s.id
    ip_protocol = -1
    cidr_ipv4 = "10.240.0.0/24"
}

resource "aws_vpc_security_group_ingress_rule" "rule2" {
    security_group_id = aws_security_group.k8s.id
    ip_protocol = -1
    cidr_ipv4 = "10.200.0.0/16"
}

resource "aws_vpc_security_group_ingress_rule" "rule3" {
    security_group_id = aws_security_group.k8s.id
    ip_protocol = "tcp"
    from_port = 22
    cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "rule4" {
    security_group_id = aws_security_group.k8s.id
    ip_protocol = "tcp"
    from_port = 6443
    cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "rule5" {
    security_group_id = aws_security_group.k8s.id
    ip_protocol = "icmp"
    from_port = -1
    cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_eip" "k8s" {
    domain = "vpc"
}