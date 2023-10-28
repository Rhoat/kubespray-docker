inventory=$1

INVENTORY_PATH="/inventory/$inventory"

if [ -z "$inventory" ]
then
    echo "Please provide inventory name"
    exit 1
fi


if [ ! -d "$INVENTORY_PATH" ]
then
    echo "Inventory $inventory does not exist"
    exit 1
fi

if [ ! -f "$INVENTORY_PATH/hosts.yaml" ]
then
    echo "Inventory $inventory does not have hosts.yaml"
    exit 1
fi

if [ ! -f "$INVENTORY_PATH/cluster-variables.yaml" ]
then
    echo "Inventory $inventory does not have cluster-variables.yaml"
    exit 1
fi

ansible-playbook -i $INVENTORY_PATH/hosts.yaml \
-e @$INVENTORY_PATH/cluster-variables.yaml \
--become --become-user=root -u ansible cluster.yml