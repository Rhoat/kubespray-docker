CLUSTER_NAME=proxmox1
cp -rfp inventory/sample /inventory/$CLUSTER_NAME
declare -a IPS=(172.16.11.33 172.16.11.34 172.16.11.35 172.16.11.129 172.16.11.130 172.16.11.131)
CONFIG_FILE=/inventory/$CLUSTER_NAME/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}