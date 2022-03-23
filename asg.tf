resource "aws_launch_configuration" "example" {
        image_id               = "ami-0ff843af0e81f1886"
        instance_type          = "t2.micro"
        security_groups        = ["sg-0becf897c06cd3dd4"]
        key_name               = "jenkins_pavani"
        /*user_data = <<-EOF
                    #!/bin/bash
                    echo "Hello, World" > index.html
                    nohup busybox httpd -f -p 8080 &
                    EOF
        lifecycle {
          create_before_destroy = true
        }*/
      }
     ## Creating AutoScaling Group
      ##resource "aws_autoscaling_group" "example" {

	/*launch_configaration = "alblconfig"*/
       /*for_each        = var.availability_zone_map*/
  	/*availability_zone = each.key*/
	## subnet_id = "subnet-073e48861cf2c339f"
        ##min_size = 2
        ##max_size = 10
        /*load_balancer = "alb"*/
       /* health_check_type = "ELB"*/
        /*tag {
          key = "Name"
          value = "terraform-asg-example"
          propagate_at_launch = true
        }*/
      ##}
