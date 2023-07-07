variable "alb_name" {
  type    = string
  default = "alb"
}

variable "alb_type" {
  type    = string
  default = "application"

}
variable "alb_http_tcp_listeners" {
  type = any
  default = [
    {
      port     = "80"
      protocol = "HTTP"
    }
  ]

}