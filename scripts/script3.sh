WORK_DIR=/tmp/lma_collector
pushd $WORK_DIR
echo "The Puppet modules are being installed from ${WORK_DIR}"
declare -a MODARRAY
declare -a FARR 
i=0
j=0
for f in $(ls /tmp/lma_influx_grafana)
do
 if [[ $f =~ \.t?gz$ ]]; then
FARR[i]=$f
i=$i+1 
 fi
done


echo "Installing module ${FARR[*]} \n"
for x in "${FARR[@]}"
do
$( echo 'puppet module install --force ' $x  )
done

popd

