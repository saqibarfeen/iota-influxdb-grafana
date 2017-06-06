yum install -y git

WORK_DIR=/tmp/lma_influx_grafana
PACKAGES_DIR=${WORK_DIR}/packages
mkdir -p ${PACKAGES_DIR}
#rm -rf ${PACKAGES_DIR:?}/*
pushd $WORK_DIR
git clone https://github.com/saqibarfeen/iota-influxdb-grafana.git
cd iota-influxdb-grafana 
./pre_build_hook && ./pre_hook
echo "The packages directory is available at ${PACKAGES_DIR}"
popd
