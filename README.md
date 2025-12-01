# Strapi Terraform Deployment

This project demonstrates how to deploy a **Strapi CMS** application on **AWS** using **Terraform**.

---

## Project Overview

The goal of this assignment is to automate the deployment of Strapi on an AWS EC2 instance. Terraform is used to provision resources such as EC2, VPC, and subnets, and set up the Strapi environment.

---

## Prerequisites

- AWS account  
- Terraform installed  
- Node.js and Yarn installed  
- Git installed  

---

## Setup Instructions

1. Clone the repository:

```bash
git clone https://github.com/khaleeluddin9912/strapi-terraform-deployment.git
cd strapi-terraform-deployment
Configure AWS credentials:

bash
Copy code
aws configure
Initialize and apply Terraform:

bash
Copy code
terraform init
terraform apply
Connect to EC2 and start Strapi:

bash
Copy code
ssh -i <your-key.pem> ubuntu@<ec2-public-ip>
yarn install
yarn develop
Access Strapi in your browser at:

cpp
Copy code
http://<ec2-public-ip>:1337
Project Structure
css
Copy code
strapi-terraform-deployment/
├── main.tf
├── variables.tf
├── outputs.tf
├── ec2.tf
├── data.tf
├── scripts/
└── README.md
Technologies Used
Terraform

AWS EC2

Strapi CMS

Node.js & Yarn

