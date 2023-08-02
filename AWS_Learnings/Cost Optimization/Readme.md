## AWS Cloud Cost Optimization - Identifying Stale Resources

### Description:
This project showcases a Lambda function designed to optimize cloud costs by identifying and eliminating stale EBS snapshots in AWS. **Stale snapshots** are those that are no longer associated with any active EC2 instance, contributing to unnecessary storage costs.

### Working:

1. The Lambda function retrieves all EBS snapshots owned by the account ('self') alongside compiling a list of active EC2 instances (running and stopped).
2. For each snapshot, it checks if the associated volume (if present) is not associated with any active instance.
3. If a stale snapshot is detected, the Lambda function deletes it, resulting in significant savings on storage expenses.
