# Terraform template to install Nextcloud on AWS wiuth EFS data store

## Our plan, brain dumnp for now

### Networking 
- VPC Creation, isolated from other VPC 
- Public and private subnets

### Nextcloud application
- NextCloud application on EC2 instance (T3 micro)
- Elastic IP
- Security Groups for nextcloud access

### Database
- MySql RDS
- Backup window
- Private subnet

### Data store 
- EFS Remote data store- 
- IAM role for EFS access