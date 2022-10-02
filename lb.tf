module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"

  name = "webserver-alb"

  load_balancer_type = "application"

  vpc_id          = "vpc-0043f6286804cd804"
  subnets         = ["subnet-01fa4e5b587c9d959", "subnet-066471f3a5166a964"]
  security_groups = ["sg-06f661dda53cf0a9d"]


  target_groups = [
    {
      name_prefix      = "lb-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      targets = {
        webserver1 = {
          target_id = module.webserver1.id
          port      = 80
        }
        webserver2 = {
          target_id = module.webserver2.id
          port      = 80
        }


      }
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]


  tags = {
    Terraform   = "true"
    Environment = "dev"
  }

}