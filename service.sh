# Schedule task

nohup /bin/sh > /dev/null 2>&1 <<EOF &

wait_boot_complete()
{
	until [ "x\$(getprop sys.boot_completed)" == "x1" ]
	do
		sleep 5
	done
}

wait_boot_complete

if [ -x "\$(command -v setenforce)" ]
then
	setenforce 0
else
	echo -n 0 > /sys/fs/selinux/enforce
fi

EOF
