# =============================================================================
# Assign values to variables
# =============================================================================

region                 = "eu-west-1"
project_name           = "aws-hcl-infra"
vpc_cidr               = "172.16.0.0/16"
public_subnet_az1_cidr = "172.16.0.0/20"
public_subnet_az2_cidr = "172.16.16.0/20"
ami                    = "ami-0df368112825f8d8f"                  //"ami-0c02fb55956c7d316"
instance_type          = "t2.micro"
