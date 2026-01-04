# Project 2 – EC2 Web Server with ALB and Auto Scaling

## Overview
This project demonstrates a highly available web application architecture on AWS using EC2, an Application Load Balancer, and Auto Scaling.

## Architecture
- Application Load Balancer in public subnets
- EC2 instances in an Auto Scaling Group across two Availability Zones
- Health checks and automatic instance replacement
- CPU-based target tracking scaling policy

## Technologies Used
- Amazon EC2
- Application Load Balancer (ALB)
- Auto Scaling Group (ASG)
- Amazon VPC
- Security Groups
- EC2 User Data
- Instance Metadata Service (IMDSv2)

## Key Learnings
- Designing highly available architectures across multiple AZs
- Restricting EC2 access to only the load balancer
- Debugging ALB 503 errors
- Handling EC2 metadata securely using IMDSv2
- Rolling updates via Launch Template versioning

## How to Test
1. Access the ALB DNS name in a browser
2. Refresh the page to observe traffic hitting different instances
3. Increase CPU load to trigger Auto Scaling events

## Improvements to Add
- HTTPS using ACM
- Centralised logging with CloudWatch
- Infrastructure as Code using Terraform