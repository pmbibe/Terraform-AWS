output "alb_lb_dns" {
  value = module.alb.lb_dns_name

}
output "alb_tg_attachments" {
  value = module.alb.target_group_attachments

}