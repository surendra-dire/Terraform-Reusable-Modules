data "aws_ami" "custom_ubuntu" {
  most_recent = true
  owners      = ["self"]  # Or use ["194343180745"] for your specific account

  filter {
    name   = "name"
    values = ["ubuntu-custom-*"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}


resource "aws_instance" "ec2_instance" {
  ami           = data.aws_ami.custom_ubuntu.id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = var.security_group_ids

 
  //count         = 2
  //user_data = "/main/userdata.sh"
   user_data = file("${path.root}/userdata.sh")

  tags = {
    Name = "${var.project_name}-ec2"
  }
 } 


/*
resource "aws_instance" "ec2_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = var.security_group_ids

 
  //count         = 2
  //user_data = "/main/userdata.sh"
   user_data = file("${path.root}/userdata.sh")

  tags = {
    Name = "${var.project_name}-ec2"
  }
 } */




 