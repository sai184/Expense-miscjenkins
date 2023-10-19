terraform {
  backend s3 {
    bucket = "terraform523"
    key    = "Expense-misjenkins/terraform.tfstate"
    region = "us-east-1"
  }
}
data "aws_instance" "instance" {
  instance_id = "i-016119378528ef465"
}

resource "aws_route53_record" "jenkins" {
  name    = "jenkins.rdevopsb72online.online"
  type    = "A"
  zone_id = "Z00468253CUIDTZTPB0D"
  records = [data.aws_instance.instance.public_ip]
  ttl = 10
}