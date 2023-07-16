module "autoscaling" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "6.10.0"
  # insert the 1 required variable here
  name                      = "test-autoscaling"
  min_size                  = 1
  max_size                  = 3
  desired_capacity          = 1
  wait_for_capacity_timeout = 0
  health_check_type         = "EC2"
  vpc_zone_identifier       = module.vpc.private_subnets
  service_linked_role_arn   = aws_iam_service_linked_role.autoscaling.arn
  #### IAM role & instance profile
  # create_iam_instance_profile = true
  # iam_role_name               = "example-asg"
  # iam_role_path               = "/ec2/"
  # iam_role_description        = "IAM role example"
  # iam_role_tags = {
  #   CustomIamRole = "Yes"
  # }
  # iam_role_policies = {
  #   AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  # }  
  target_group_arns = module.nlb.target_group_arns
  #### ASG Lifecycle hooks
  initial_lifecycle_hooks = [
    {
      name                  = "ExampleStartupLifeCycleHook"
      default_result        = "CONTINUE"
      heartbeat_timeout     = 60
      lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
      notification_metadata = jsonencode({ "hello" = "world" })
    },
    {
      name                  = "ExampleTerminationLifeCycleHook"
      default_result        = "CONTINUE"
      heartbeat_timeout     = 180
      lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
      notification_metadata = jsonencode({ "goodbye" = "world" })
    }
  ]

  instance_refresh = {
    strategy = "Rolling"
    preferences = {
      min_healthy_percentage = 50
      # checkpoint_delay       = 600
      # checkpoint_percentages = [35, 70, 100]
      # instance_warmup        = 300

    }
    triggers = ["tag"]
    # triggers = ["tag", "desired_capacity" /*, "launch_configuration"*/] #
  }
  # ASG Launch configuration
  launch_template_name        = "example-asg"
  launch_template_description = "Launch template example"
  update_default_version      = true

  image_id          = data.aws_ami.amzlinux2.id
  instance_type     = var.ec2_instance_type
  key_name          = var.ec2_instance_keypair
  user_data         = filebase64("${path.module}/app1-install.sh")
  ebs_optimized     = false
  enable_monitoring = false

  security_groups = [module.private_security_group.security_group_id]
  # associate_public_ip_address = false
  block_device_mappings = [
    {
      # Root volume
      device_name = "/dev/xvda"
      no_device   = 0
      ebs = {
        delete_on_termination = true
        encrypted             = true
        volume_size           = 20
        volume_type           = "gp2"
      }
    }
  ]
  # metadata_options = {
  #   http_endpoint               = "enabled"
  #   http_tokens                 = "optional" # At production grade you can change to "required", for our example if is optional we can get the content in metadata.html
  #   http_put_response_hop_limit = 32
  # }

  tags = local.asg_tags
}