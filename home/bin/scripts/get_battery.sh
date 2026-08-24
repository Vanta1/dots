bat=`acpi -b | cut -d " " -f 4`
if [[ $bat == *,*  ]] 
then
  echo `echo $bat | head -c -3`
else
  echo `echo $bat | head -c -2`
fi
