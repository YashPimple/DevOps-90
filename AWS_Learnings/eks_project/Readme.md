## AWS-EKS Project 

Deploying a 2048 game using EKS, ALB, and Ingress

## Prerequisites

kubectl – A command line tool for working with Kubernetes clusters. For more information, see [Installing or updating kubectl]("https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html").

eksctl – A command line tool for working with EKS clusters that automates many individual tasks. For more information, see [Installing or updating]("https://docs.aws.amazon.com/eks/latest/userguide/eksctl.html").

AWS CLI – A command line tool for working with AWS services, including Amazon EKS. For more information, see [Installing, updating, and uninstalling the AWS CLI]("https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html") in the AWS Command Line Interface User Guide. 

## Installing eks cluster using Fargate

- ### Creating a cluster
    ```
    eksctl create cluster --name demo-cluster --region ap-northeast-1 --fargate
    ```

- ### Delete the cluster

    ```
    eksctl delete cluster --name demo-cluster --region us-east-1
     ```

## Update a kubeconfig for your cluster

The following command updates the default kubeconfig file to use your cluster as the current context.
- Command:
    ```
    aws eks update-kubeconfig --name example
    ```

## Creating a Fargate profile

    ```
    eksctl create fargateprofile \
        --cluster demo-cluster \
        --region us-east-1 \
        --name alb-sample-app \
        --namespace game-2048
    ```

## Deploy the deployment, service and Ingress

  ```
  kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.5.4/docs/examples/2048/2048_full.yaml
  ```

## configure IAM OIDC provider 

  ```
  export cluster_name=demo-cluster
  ```

  ```
  oidc_id=$(aws eks describe-cluster --name $cluster_name --query "cluster.identity.oidc.issuer" --output text | cut -d '/' -f 5) 
  ```

## Check if there is an IAM OIDC provider configured already

- aws iam list-open-id-connect-providers | grep $oidc_id | cut -d "/" -f4\n 

If not, run the below command
  ```
  eksctl utils associate-iam-oidc-provider --cluster $cluster_name --approve
  ```

## Setting-up alb add on

### Download IAM policy

    ```
    curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.5.4/docs/install/iam_policy.json
    ```

## Create an IAM Policy

    ```
    aws iam create-policy \
        --policy-name AWSLoadBalancerControllerIAMPolicy \
        --policy-document file://iam_policy.json
    ```

## Create IAM Role

      ```
      eksctl create iamserviceaccount \
        --cluster=demo-cluster \
        --namespace=kube-system \
        --name=aws-load-balancer-controller \
        --role-name AmazonEKSLoadBalancerControllerRole \
        --attach-policy-arn=arn:aws:iam::<your-aws-account-id>:policy/AWSLoadBalancerControllerIAMPolicy \
        --approve
      ```

## Deploy ALB controller

- Add helm repo
    ```
    helm repo add eks https://aws.github.io/eks-charts
    ```

- Update the repo
    ```
    helm repo update eks
    ```

- Install
  ```
  helm install aws-load-balancer-controller eks/aws-load-balancer-controller \            
    -n kube-system \
    --set clusterName=<your-cluster-name> \
    --set serviceAccount.create=false \
    --set serviceAccount.name=aws-load-balancer-controller \
    --set region=<region> \
    --set vpcId=<your-vpc-id>
  ```

- Verify that the deployments are running.
  ```
  kubectl get deployment -n kube-system aws-load-balancer-controller
  ```


