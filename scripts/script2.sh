WORK_DIR=/tmp/lma_influx_grafana
#mkdir -p ${WORK_DIR}
#rm -rf ${WORK_DIR:?}/*
pushd $WORK_DIR
#git clone https://github.com/openstack/fuel-plugin-lma-collector.git
#git clone https://saqibarfeen:cloud9net@github.com/cloud9network/observer9.git
cd iota-influxdb-grafana/deployment_scripts/puppet/modules/
for module in $(ls .) 
do
   pushd $module
   puppet module build
   cp pkg/*.tar.gz ${WORK_DIR}
   popd
done
echo "The Puppet modules are available at ${WORK_DIR}"
