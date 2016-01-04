if [ "$1" = "--help" ]
then
	echo "Usage: $0 NAME MEMORY NIC_COUNT OSTYPE SIZE ISO_PATH"
else
	VBoxManage createvm --name "$1" --register
	VBoxManage modifyvm "$1" --memory "$2" --acpi on --boot1 dvd
	
	for (( i=1; i<=$3; i++ ))
	do
		echo $i
		echo $3
		VBoxManage modifyvm "$1" --nic$i bridged --bridgeadapter$i eth0
		macaddress=$(dd if=/dev/urandom bs=10 count=1 status=none | sha256sum | cut -c1-12)
		macaddress=${macaddress^^}
		echo $macaddress
		VBoxManage modifyvm "$1" --macaddress$i $macaddress
	done

	VBoxManage modifyvm "$1" --ostype "$4"
	VBoxManage createhd --filename ./"$1".vdi --size "$5"
	VBoxManage storagectl "$1" --name "SATA Controller" --add sata --portcount 2
	VBoxManage storageattach "$1" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium ./"$1".vdi
	VBoxManage storageattach "$1" --storagectl "SATA Controller" --port 1 --device 0 --type dvddrive --medium "$6"
fi
