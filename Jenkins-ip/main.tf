terraform {
  backend s3 {
    bucket = "terraform523"
    key    = "Expense-misjenkins/terraform.tfstate"
    region = "us-east-1"
  }
}
data "aws_instance" "instance" {
  instance_id = "i-016119378528ef465"
}                                              #if public ip changes when i stop and start instahnces, if there is any change to github from local system i am goint to push code from dev pc if any time he push the code to github forwarded url should trigger to jenkins

resource "aws_route53_record" "jenkins" {
  name    = "jenkins.rdevopsb72online.online"
  type    = "A"
  zone_id = "Z00468253CUIDTZTPB0D"
  records = [data.aws_instance.instance.public_ip]
  ttl = 10
}

#in companies no need this it has enetrpse gihubs acces private ips they will accsss