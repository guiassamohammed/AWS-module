variable "vpc_name" {
  description = "Name of VPC"
  type        = string
  default     = ""
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_region" {
  description = "Region for VPC"
  type        = string
  default     = ""
}
