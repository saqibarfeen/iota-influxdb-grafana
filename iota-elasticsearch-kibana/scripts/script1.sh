yum install -y git

WORK_DIR=/tmp/lma_logging
PACKAGES_DIR=${WORK_DIR}/packages
mkdir -p ${PACKAGES_DIR}
#rm -rf ${PACKAGES_DIR:?}/*
pushd $WORK_DIR
cd observer9 
./pre_build_hook && ./pre_hook
cp ./repositories/ubuntu/*.deb ${PACKAGES_DIR}
(cd ${PACKAGES_DIR} && dpkg-scanpackages . > Packages)
echo "The packages directory is available at ${PACKAGES_DIR}"
popd
