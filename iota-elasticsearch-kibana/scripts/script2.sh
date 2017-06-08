WORK_DIR=/tmp/lma_logging
mkdir -p $WORK_DIR
pushd $WORK_DIR
cd /root/workspace/fuel-plugin-elasticsearch-kibana/deployment_scripts/puppet/modules
for module in $(ls .) 
do
   pushd $module
   puppet module build
   cp pkg/*.tar.gz ${WORK_DIR}
   popd
done
echo "The Puppet modules are available at ${WORK_DIR}"
