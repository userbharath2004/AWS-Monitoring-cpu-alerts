variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "instance_id" {
  description = "The ID of the EC2 instance to monitor"
  type        = string
}

variable "alert_email" {
  description = "Email address to receive CPU alerts"
  type        = string
}

variable "cpu_threshold" {
  description = "The CPU percentage that triggers the alarm"
  type        = number
  default     = 70
}