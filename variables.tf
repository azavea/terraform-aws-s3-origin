variable "bucket_name" {
  type = string
}

variable "logs_bucket_name" {
  type = string
}

variable "cors_allowed_headers" {
  default = ["Authorization"]
  type    = list(string)
}

variable "cors_allowed_methods" {
  default = ["GET"]
  type    = list(string)
}

variable "cors_allowed_origins" {
  default = ["*"]
  type    = list(string)
}

variable "cors_expose_headers" {
  default = []
  type    = list(string)
}

variable "cors_max_age_seconds" {
  default = 3000
  type    = number
}

variable "region" {
  default = "us-east-1"
  type    = string
}

variable "project" {
  default = "Unknown"
  type    = string
}

variable "environment" {
  default = "Unknown"
  type    = string
}

variable "tags" {
  default = {}
  type    = map(string)
}
