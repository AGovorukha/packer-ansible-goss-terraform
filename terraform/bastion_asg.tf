resource "aws_launch_configuration" "bastion_as_conf" {
  name_prefix                 = "iec-prod-bastion-lc-"
  image_id                    = var.ami_id
  instance_type               = "t2.nano"
  enable_monitoring           = true
  key_name                    = var.ssh_key_name
  security_groups             = [aws_security_group.bastion_sg.id]
  associate_public_ip_address = true

  root_block_device {
    volume_type               = "gp2"
    volume_size               = 8
    delete_on_termination     = true
  }

    lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "bastion_as_group" {
  name                        = "iec-prod-bastion-asg"
  launch_configuration        = aws_launch_configuration.bastion_as_conf.name
  min_size                    = 1
  max_size                    = 2
  desired_capacity            = 1
  health_check_grace_period   = 60
  health_check_type           = "EC2"
  force_delete                = true
  vpc_zone_identifier         = [var.bastion_subnet_1, var.bastion_subnet_2]

  lifecycle {
    create_before_destroy     = true
  }

  tags                        = [
    {
      key                     = "Owner"
      value                   = "AndriiGovorukha@gmail.com"
      propagate_at_launch     = true
    }
  ]
}