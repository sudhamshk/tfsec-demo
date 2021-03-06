resource "aws_vpc" "my-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
}

resource "aws_security_group" "bastion_sg" {
  vpc_id      = aws_vpc.my-vpc
  name        = "bastion_sg"
  description = "bastion security group"
}

resource "aws_security_group_rule" "bastion_sg_ingress" {
  security_group_id = aws_security_group.bastion_sg.id
  description       = "ssh from IP"
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_blocks       = ["83.12.11.42/32"]
}
