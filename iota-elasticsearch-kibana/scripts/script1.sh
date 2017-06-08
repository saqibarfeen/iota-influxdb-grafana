yum install -y git

WORK_DIR=/tmp/lma_collector
PACKAGES_DIR=${WORK_DIR}/packages
mkdir -p ${PACKAGES_DIR}
#rm -rf ${PACKAGES_DIR:?}/*
pushd $WORK_DIR
#git clone https://github.com/openstack/fuel-plugin-lma-collector.git
git clone https://saqibarfeen:cloud9net@github.com/cloud9network/observer9.git 
cd observer9 
./pre_build_hook && ./pre_hook
cp ./repositories/ubuntu/*.deb ${PACKAGES_DIR}
(cd ${PACKAGES_DIR} && dpkg-scanpackages . > Packages)
echo "The packages directory is available at ${PACKAGES_DIR}"
popd
