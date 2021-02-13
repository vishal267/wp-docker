resource "aws_security_group" "ingress-efs" {
   name = "ingress-efs-sg"
   vpc_id = var.vpc_id

   ingress {
     security_groups = ["${aws_security_group.ingress-env.id}"]
     from_port = 2049
     to_port = 2049
     protocol = "tcp"
   }

   egress {
     security_groups = ["${aws_security_group.ingress-env.id}"]
     from_port = 0
     to_port = 0
     protocol = "-1"
   }
 }
