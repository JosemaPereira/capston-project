#!/bin/bash
INFO=`tput setaf 6`
RESET=`tput sgr0`
export CSV_FILE=assets/user_purchase.csv

echo "${INFO}Terraform Init${RESET}"
terraform init

echo "${INFO}Terraform Apply${RESET}"
terraform apply --var-file=terraform.tfvars
export NFS_SERVER=$(terraform output -raw efs)
export S3_BUCKET=$(terraform output -raw s3)

echo "${INFO}Uploading CSV files to $S3_BUCKET${RESET}"
aws s3 cp $CSV_FILE s3://$S3_BUCKET

echo "${INFO}Update EKS config${RESET}"
aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)

echo "${INFO}Creating Kubectl namespaces${RESET}"
kubectl create namespace storage
kubectl create namespace airflow

echo "${INFO}Adding repo to helm${RESET}"
helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/
helm repo add apache-airflow https://airflow.apache.org
helm repo update

echo "${INFO}Installing nfs-subdir-external-provisioner${RESET}"

helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner \
    --namespace storage \
    --set nfs.server=$NFS_SERVER \
    --set nfs.path=/

echo "${INFO}Installing airflow${RESET}"
helm install airflow -f airflow-values.yaml apache-airflow/airflow --namespace airflow
kubectl port-forward svc/airflow-webserver 8080:8080 --namespace airflow 

echo "${INFO}Completed${RESET}"