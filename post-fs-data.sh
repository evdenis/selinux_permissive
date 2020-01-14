if [ -x "$(command -v setenforce)" ]
then
	setenforce 0
else
	echo -n 0 > /sys/fs/selinux/enforce
fi
