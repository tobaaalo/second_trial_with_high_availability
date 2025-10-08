resource "aws_launch_template" "launch_template" {
  name_prefix   = "launch-template-"
  image_id      = data.aws_ssm_parameter.instance_ami.value
  instance_type = var.instance_type
  key_name      = var.keyname

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.instance_sg.id]
  }

  user_data = filebase64("userdata.sh")

  lifecycle {
    create_before_destroy = true
  }
}