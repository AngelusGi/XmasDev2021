module "az_devops" {
  source = "./modules/azure_devops/"

  # droplet_count = 3
  # group_name    = "group1"
}

# output "loadbalancer-ip" {
#   value = module.groups.lb_ip
# }


