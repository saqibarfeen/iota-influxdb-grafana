WORK_DIR=/tmp/lma_logging
pushd $WORK_DIR
echo "The Puppet modules are being installed from ${WORK_DIR}"
declare -a MODARRAY
i=0
for f in $(ls /tmp/lma_logging)
do
 if [[ $f =~ \.t?gz$ ]]; then
MODARRAY[i]=$f
i=$i+1 
 fi
done

echo "Installing module ${MODARRAY[*]}"
for x in "${MODARRAY[@]}"
do
$( echo 'puppet module install --force' $x  )
done

popd

