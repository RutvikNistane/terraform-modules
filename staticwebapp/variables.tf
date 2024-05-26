
variable "app_name" {
  description = "Application name"
  type        = string
}

variable "instance_size" {
  description = "EC2 instance size"
  type = string
  default = "t2.micro"
}

variable "environment" {
  description = "Environment Name"
  type        = string
}

variable "key_path" {
  description = "Public shh key path"
  type        = string
  #  default     = "./rsa_id.pub"
  validation {
    condition     = fileexists(var.key_path)
    error_message = "Public SSH key not found"
  }
}

variable "private_key_path" {
  description = "Private shh key path"
  type        = string
  validation {
    condition     = fileexists(var.private_key_path)
    error_message = "Private  SSH key not found"
  }
}



variable "ports" {
  type        = any
  description = "list of ports objects"
}


variable "bootstrap_script" {
  type = string
  validation {
    condition     = fileexists(var.bootstrap_script)
    error_message = "bootstrap script not found"
  }
}


variable "project_files" {
  description = "enter your project folder path"
  type        = string
  default     = "../src/"
}


variable "project_destination" {
  description = "enter your project folder path on server"
  type        = string
  default     = "/var/www/html/"
}