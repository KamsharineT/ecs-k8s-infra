variable "cluster_id" {
    type    = string
}
variable "subnets" { 
    type = list(string) 
    }
variable "security_group_id" {
    type    = string
}
variable "service_name" {
    type    = string
}
variable "alb_arn" {
    type    = string
}
variable "vpc_id" {
    type    = string
}