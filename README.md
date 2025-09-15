# Terraform IaC for AWS Infrastructure

## 📌 Overview
This project provisions **AWS VPC, EC2, and RDS** using **Terraform**.  
It ensures reproducibility across environments (**dev, staging, prod**) using **variables** and **modules** for clean structure.

---

## 🏗️ Architecture Diagram
Below is a simplified architecture representation (can be drawn in **draw.io** or **Lucidchart**):

![AWS Architecture](/aws_architecture.png)

- **VPC** – Provides isolated networking.  
- **EC2** – Hosts the application.  
- **RDS** – Managed relational database.  

---

## ⚙️ Tech Stack Justification

- **Terraform**:  
  - Chosen for its popularity and strong ecosystem in **Infrastructure as Code (IaC)**.  
  - Enables modular, reusable, and environment-specific deployments.  

- **AWS VPC**:  
  - Provides secure and isolated networking for application workloads.  

- **AWS EC2**:  
  - Chosen as a flexible compute option to host applications.  

- **AWS RDS**:  
  - Provides a **managed database** with automated backups, patching, and scaling.  

---

## 🚀 Deployment Steps

### 1. Prerequisites
- Install **Terraform** (v1.5+ recommended).  
- Configure AWS CLI with valid credentials:  
  ```bash
  aws configure
  ```

### 2. Clone Repository
```bash
git clone <your-repo-url>
cd terraform_iac_for_project
```

### 3. Initialize Terraform
```bash
terraform init
```

### 4. Select Environment
Each environment has its own configuration under `envs/`.

For **dev**:
```bash
cd envs/dev
terraform plan -var-file=dev.tfvars
terraform apply -var-file=dev.tfvars -auto-approve
```

For **staging**:
```bash
cd envs/staging
terraform plan -var-file=staging.tfvars
terraform apply -var-file=staging.tfvars -auto-approve
```

For **prod**:
```bash
cd envs/prod
terraform plan -var-file=prod.tfvars
terraform apply -var-file=prod.tfvars -auto-approve
```

### 5. Verify Deployment
- Check created **VPC** in AWS Console → VPC Dashboard.  
- Verify **EC2 instance** is running in EC2 Dashboard.  
- Confirm **RDS instance** is available under RDS Dashboard.  

### 6. Destroy (Optional)
To clean up resources:
```bash
terraform destroy -var-file=dev.tfvars -auto-approve
```

---

## ✅ Testing
- SSH into EC2 to validate connectivity.  
- Connect EC2 to RDS instance using database endpoint.  
- Ensure network isolation via VPC security groups.  

---

## 📂 Project Structure
```
terraform_iac_for_project/
│── modules/
│   ├── vpc/        # VPC module
│   ├── ec2/        # EC2 module
│   ├── rds/        # RDS module
│── envs/
│   ├── dev/        # Dev environment configs
│   ├── staging/    # Staging environment configs
│   ├── prod/       # Production configs
│── provider.tf     # AWS provider setup
│── variables.tf    # Global variables
│── outputs.tf      # Global outputs
│── README.md       # Documentation
```

---

## 🌟 Notes
- This project is modular and supports **multiple environments**.  
- Can be extended to include **Load Balancers, Auto Scaling, and Monitoring**.  

