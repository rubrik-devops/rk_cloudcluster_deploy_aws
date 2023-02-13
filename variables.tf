# Instance/Node Settings
variable "aws_region" {
  description = "The region to deploy Rubrik Cloud Cluster nodes."
}

variable "aws_instance_type" {
  description = "The type of instance to use as Rubrik Cloud Cluster nodes. CC-ES requires m5.4xlarge."
  default     = "m5.4xlarge"
}

variable "aws_disable_api_termination" {
  description = "If true, enables EC2 Instance Termination Protection on the Rubrik Cloud Cluster nodes."
  default     = true
}

variable "aws_tags" {
  description = "Tags to add to the AWS resources that this Terraform script creates, including the Rubrik cluster nodes."
  type        = map(string)
  default     = {}
}

variable "number_of_nodes" {
  description = "The total number of nodes in Rubrik Cloud Cluster."
  default     = 3
}

variable "aws_ami_owners" {
  description = "AWS marketplace account(s) that owns the Rubrik Cloud Cluster AMIs. Use use 679593333241 for AWS Commercial and 345084742485 for AWS GovCloud."
  type        = set(string)
  default     = ["679593333241"]
}

variable "aws_ami_filter" {
  description = "Cloud Cluster AWS AMI name pattern(s) to search for. Use 'rubrik-mp-cc-<X>*' without the single quotes. Where <X> is the major version of CDM. Ex. 'rubrik-mp-cc-7*'"
  type        = set(string)
}

variable "aws_image_id" {
  description = "AWS Image ID to deploy. Set to 'latest' or leave blank to deploy the latest version from the marketplace."
  type        = string
  default     = "latest"
}

variable "aws_key_pair_name" {
  description = "Name for the AWS SSH Key-Pair being created or the existing AWS SSH Key-Pair being used."
  type        = string
  default     = ""
}

variable "private_key_recovery_window_in_days" {
  description = "Recovery window in days to recover script generated ssh private key."
  default     = 30
}

# Network Settings
variable "aws_vpc_cloud_cluster_nodes_sg_name" {
  description = "The name of the security group to create for Rubrik Cloud Cluster to use."
  default     = "Rubrik Cloud Cluster Nodes"
}

variable "cloud_cluster_nodes_admin_cidr" {
  description = "The CIDR range for the systems used to administer the Cloud Cluster via SSH and HTTPS."
  type        = string
  default     = "0.0.0.0/0"
}
variable "aws_vpc_cloud_cluster_hosts_sg_name" {
  description = "The name of the security group to create for Rubrik Cloud Cluster to communicate with EC2 instances."
  default     = "Rubrik Cloud Cluster Hosts"
}

variable "aws_cloud_cluster_nodes_sg_ids" {
  description = "Additional security groups to add to Rubrik cluster nodes."
  type        = list(string)
  default     = []
}

variable "aws_subnet_id" {
  description = "The VPC Subnet ID to launch Rubrik Cloud Cluster in."
}

# Storage Settings
variable "cluster_disk_type" {
  description = "Disk type for the data disks (st1, sc1 or gp2). Use gp2 for CC-ES. Use sc1 for 48TB CC nodes. Use st1 for all others. "
  default     = "gp2"
}

variable "cluster_disk_size" {
  description = "The size (in GB) of each data disk on each node. Cloud Cluster ES only requires 1 512 GB disk per node."
  default     = "1024"
}

variable "cluster_disk_count" {
  description = "The number of disks for each node in the cluster. Set to 1 to use with S3 storage for Cloud Cluster ES."
  type        = number
  default     = 3
}


# Bootstrap Settings
variable "cluster_name" {
  description = "Unique name to assign to the Rubrik Cloud Cluster. This will also be used to populate the EC2 instance name tag. For example, rubrik-cloud-cluster-1, rubrik-cloud-cluster-2 etc."
  default     = "rubrik-cloud-cluster"
}

variable "admin_email" {
  description = "The Rubrik Cloud Cluster sends messages for the admin account to this email address."
}

variable "admin_password" {
  description = "Password for the Rubrik Cloud Cluster admin account."
  default     = "ChangeMe"
}

variable "dns_search_domain" {
  type        = list(any)
  description = "List of search domains that the DNS Service will use to resolve hostnames that are not fully qualified."
  default     = []
}

variable "dns_name_servers" {
  type        = list(any)
  description = "List of the IPv4 addresses of the DNS servers."
  default     = ["169.254.169.253"]
}

variable "ntp_server1_name" {
  description = "The FQDN or IPv4 addresses of network time protocol (NTP) server #1."
  type        = string
  default     = "8.8.8.8"
}
variable "ntp_server1_key_id" {
  description = "The ID number of the symmetric key used with NTP server #1. (Typically this is 0)"
  type        = number
  default     = 0
}
variable "ntp_server1_key" {
  description = "Symmetric key material for NTP server #1."
  type        = string
  sensitive   = true
  default     = ""
}
variable "ntp_server1_key_type" {
  description = "Symmetric key type for NTP server #1."
  type        = string
  sensitive   = true
  default     = ""
}
variable "ntp_server2_name" {
  description = "The FQDN or IPv4 addresses of network time protocol (NTP) server #2."
  type        = string
  default     = "8.8.4.4"
}
variable "ntp_server2_key_id" {
  description = "The ID number of the symmetric key used with NTP server #2. (Typically this is 0)"
  type        = number
  default     = 0
}
variable "ntp_server2_key" {
  description = "Symmetric key material for NTP server #2."
  type        = string
  sensitive   = true
  default     = ""
}
variable "ntp_server2_key_type" {
  description = "Symmetric key type for NTP server #2."
  type        = string
  sensitive   = true
  default     = ""
}
variable "timeout" {
  description = "The number of seconds to wait to establish a connection the Rubrik cluster before returning a timeout error."
  default     = 15
}