# Troubleshooting Notes – Project 2

## ALB returned 503 Service Temporarily Unavailable
**Issue:**  
ALB was reachable but returned 503 errors.

**Cause:**  
Target group had no healthy instances due to web server not responding.

**Fix:**  
Verified security group rules, ensured Apache was installed via user data, and corrected subnet routing.

---

## Instance metadata not displaying
**Issue:**  
Instance ID and Availability Zone were blank on the webpage.

**Cause:**  
Instance Metadata Service required IMDSv2, but user data script was using IMDSv1.

**Fix:**  
Updated user data to request an IMDSv2 token and rolled out a new Launch Template version via Auto Scaling.