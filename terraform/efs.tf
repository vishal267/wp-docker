resource "aws_efs_file_system" "wp-docker" {
   creation_token = "wp-docker"
   performance_mode = "generalPurpose"
   throughput_mode = "bursting"
   encrypted = "true"
 tags = {
     Name = "wp-docker"
   }
 }
