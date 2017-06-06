WORK_DIR="$(dirname "$(readlink -f "$0")")"/puppet_modules
pushd $WORK_DIR 
declare -a FARR 
i=0
for f in $(ls .)
do
 if [[ $f =~ \.t?gz$ ]]; then
FARR[i]=$f
i=$i+1 
 fi
done


echo "Installing module ${FARR[*]} \n"
for x in "${FARR[@]}"
do
$( echo 'puppet module install ' $x )
done
popd
