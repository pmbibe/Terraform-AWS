# https://docs.aws.amazon.com/securityhub/latest/userguide/cloudwatch-controls.html - L11

# Import 

```
import {
  to = aws_instance.myec2vmZ
  id = "i-034487888f869cbbf"  
}
```
```
terraform plan -generate-config-out=generated.tf
```
```
aws_instance.myec2vmZ: Preparing import... [id=i-034487888f869cbbf]
data.aws_ami.amzlinux2: Reading...
aws_instance.myec2vmZ: Refreshing state... [id=i-034487888f869cbbf]
data.aws_availability_zones.azones: Reading...
data.aws_availability_zones.azones: Read complete after 0s [id=ap-southeast-1]
data.aws_ec2_instance_type_offerings.ins_type["ap-southeast-1b"]: Reading...
data.aws_ec2_instance_type_offerings.ins_type["ap-southeast-1c"]: Reading...
data.aws_ec2_instance_type_offerings.ins_type["ap-southeast-1a"]: Reading...
data.aws_ec2_instance_type_offerings.ins_type["ap-southeast-1a"]: Read complete after 0s [id=ap-southeast-1]
data.aws_ec2_instance_type_offerings.ins_type["ap-southeast-1c"]: Read complete after 0s [id=ap-southeast-1]
data.aws_ec2_instance_type_offerings.ins_type["ap-southeast-1b"]: Read complete after 0s [id=ap-southeast-1]
data.aws_ami.amzlinux2: Read complete after 0s [id=ami-079dad13755394907]

Planning failed. Terraform encountered an error while generating this plan.

╷
│ Warning: Config generation is experimental
│ 
│ Generating configuration during import is currently experimental, and the generated configuration format may change in future versions.
╵
╷
│ Error: Conflicting configuration arguments
│ 
│   with aws_instance.myec2vmZ,
│   on generated.tf line 14:
│   (source code not available)
│ 
│ "ipv6_address_count": conflicts with ipv6_addresses
╵
╷
│ Error: Conflicting configuration arguments
│ 
│   with aws_instance.myec2vmZ,
│   on generated.tf line 15:
│   (source code not available)
│ 
│ "ipv6_addresses": conflicts with ipv6_address_count
```
```
# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_instance" "myec2vmZ" {
  ami                                  = "ami-079dad13755394907"
  associate_public_ip_address          = true
  availability_zone                    = "ap-southeast-1b"
  disable_api_stop                     = false
  disable_api_termination              = false
  ebs_optimized                        = false
  get_password_data                    = false
  hibernation                          = false
  host_id                              = null
  host_resource_group_arn              = null
  iam_instance_profile                 = null
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t2.micro"
  key_name                             = null
  monitoring                           = false
  placement_group                      = null
  placement_partition_number           = 0
  secondary_private_ips                = []
  security_groups                      = ["default"]
  source_dest_check                    = true
  subnet_id                            = "subnet-56d6041e"
  tags = {
    Name = "For-Each-DemoY"
  }
  tags_all = {
    Name = "For-Each-DemoY"
  }
  tenancy                     = "default"
  user_data                   = null
  user_data_base64            = null
  user_data_replace_on_change = null
  volume_tags                 = null
  vpc_security_group_ids      = ["sg-11a9535a"]
  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }
  cpu_options {
    amd_sev_snp      = null
    core_count       = 1
    threads_per_core = 1
  }
  credit_specification {
    cpu_credits = "standard"
  }
  enclave_options {
    enabled = false
  }
  maintenance_options {
    auto_recovery = "default"
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "optional"
    instance_metadata_tags      = "disabled"
  }
  private_dns_name_options {
    enable_resource_name_dns_a_record    = false
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    iops                  = 100
    kms_key_id            = null
    tags                  = {}
    throughput            = 0
    volume_size           = 8
    volume_type           = "gp2"
  }
}
```
