variable "AWS_ACCESS_KEY"{
}

variable "AWS_SECRET_KEY"{
}

variable "AWS_REGION"{
  default = "us-east-1"
}

variable "AMIS"{
  type = map(string)
  default = {
    us-east-1 = "ami-05e00da24aba682c3"
  }
}

variable "INSTANCE_USERNAME"{
  default = "ubuntu"
}

