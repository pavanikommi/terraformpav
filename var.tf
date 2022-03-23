variable "ami_id" {
    default="ami-04505e74c0741db8d"
}

variable "instance_type" {
    default="t2.micro"
}

variable "key_name" {
    default = "jenkins_pavani"
}

variable "tag_name"{
    default = "pavani"

}



variable "availability_zone_map" {
    description = "Availability zone for instance"
    type        = map
    default     = {
        "us-east-1a" = 1
        "us-east-1b" = 2
        "us-east-1c" = 3
    }

}
