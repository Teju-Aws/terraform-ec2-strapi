TASK:

Provision an EC2 instance and create a .pem file through terraform and managed by terraform  Run strapi in the EC2 and make a loom video for all that process  Please make sure to use module structure for terraform Create a git repo and raise pr

IMPLEMENTATTION:


Terraform EC2 Provisioning and Strapi Deployment

Project Overview:

This project demonstrates how to:

1.Provision an EC2 instance in AWS using Terraform.

2.Create and manage a .pem key pair through Terraform.

3.Install and run Strapi on the EC2 instance.

4.Use a module-based structure for Terraform.

5.Push the code to a Git repository and raise a Pull Request.



Firstly we need to install terraform,git in your local system & after that you have to make a folder structure about what you are going to do 

terraform-ec2-strapi/
│
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
├── terraform.tfvars
│
├── modules/
│   └── ec2/
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│
└── README.md
 The above one is my folder structure



what are modules ? why we need them?


Module is nothing but a template which we can reuse, suppose if we have dev,prod & test environments instead of going & writing the code everytime if we create a module....we can reuse them just by passing the values.

* in the above given task i have created a ec2 instance & creating a key pair along with the instance creation ,next by using userdata we can install strapi in the instance 

* or else we can install once the instance got creating by ssh into it

* once everything done i push the code to GitHub & raise a PR.
