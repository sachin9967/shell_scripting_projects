# AWS Resource Usage Reporter 🛠️☁️

This Bash script lists key AWS resources from your account using AWS CLI. It's intended for basic reporting and visibility of active cloud assets.

---

## 📜 Script Overview

**Filename:** `aws_resource_listing.sh`  
**Author:** Sachin  
**Version:** v1  
**Last Updated:** 14 July  
**Purpose:** To generate a simple report of AWS resource usage.

---

## 🔧 What the Script Does

This script collects and displays the following AWS resource information:

- ✅ **S3 Buckets** – Lists all buckets in your account
- ✅ **EC2 Instances** – Lists instance IDs of all running EC2 instances
- ✅ **Lambda Functions** – Lists all available Lambda functions
- ✅ **IAM Users** – Lists all IAM users in the account

The S3 bucket and Lambda output are written to a file named `resourceTracker`.

---

## 💡 Prerequisites

To use this script, make sure:

- AWS CLI is installed  
  ↪ [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- You have configured your AWS credentials  
  ↪ Run: `aws configure`
- You have `jq` installed to parse JSON  
  ↪ Install with: `sudo apt install jq`

---

## 🚀 How to Use

```bash
# Make the script executable
chmod +x aws_resource_listing.sh

# Run the script
./aws_resource_listing.sh
