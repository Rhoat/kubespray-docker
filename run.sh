IMAGE_TAG="v2.23.0"

docker pull quay.io/kubespray/kubespray:$IMAGE_TAG
docker run --rm -it \
--mount type=bind,source="$(pwd)"/inventory,dst=/inventory \
--mount type=bind,source="${HOME}"/.ssh/id_rsa,dst=/root/.ssh/id_rsa \
--mount type=bind,source="$(pwd)"/scripts,dst=/scripts \
quay.io/kubespray/kubespray:$IMAGE_TAG bash