# EC2 Instance
resource "aws_instance" "myec2vm" {
  ami = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type
  for_each = toset(keys({ 
    for az, details in data.aws_ec2_instance_type_offerings.ins_type :
        az => details.instance_types 
            if length(details.instance_types) != 0 
    })
        )
  availability_zone = each.key # You can also use each.value because for list items each.key == each.value
  tags = {
    "Name" = "For-Each-Demo-${each.key}"
  }
}