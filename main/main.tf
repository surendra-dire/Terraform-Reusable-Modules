# =============================================================================
# Call reusable modules
# =============================================================================

module "call-vpc-module" {
  source       = "../modules/vpc"
  project_name = var.project_name
  //region       = var.region
  vpc_cidr   = var.vpc_cidr
  public_subnet_az1_cidr = var.public_subnet_az1_cidr
  public_subnet_az2_cidr =var.public_subnet_az2_cidr
}

module "call-security-group" {
  source = "../modules/security-group"
  vpc_id = module.call-vpc-module.vpc_id
  allowed_ports=  [80, 22, 443, 8080]
}   

/*
module "call-ecs-module" {
  source = "../modules/ECS"
  
  security_group_id = module.call-security-group.security_group_id
  subnet_ids = [module.call-vpc-module.subnet_id_az1, module.call-vpc-module.subnet_id_az2]

}
*/

module "call-ec2-module" {
  source        = "../modules/ec2-instance"
  ami           = var.ami
  instance_type = var.instance_type
  project_name  = var.project_name
  subnet_id = module.call-vpc-module.subnet_id_az1
  security_group_ids = [module.call-security-group.security_group_id]

}  