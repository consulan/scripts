#!/bin/bash
numero=1
suf_arch=$(ls /var/log/syslog/ | grep log | cut -c1-6 ) #sufijo del archivo (remote)
arch_gz=$(ls /var/log/syslog/ | grep gz | wc -l)
if [ $arch_gz > 0 ]
	then
		nume=$(ls -t /var/log/syslog/ | grep gz | head -n1 | cut -c7-7 ) #numero del ultimo archivo .gz que esta. 
		arch=$(ls /var/log/syslog/ | grep log | cut -c1-6)
		if [ "$nume" -eq 9 ] 
			then
				nuevo_arch=$arch$numero.gz
			else
				nuevo_arch=$arch$((nume + 1)).gz
			fi
		echo $nuevo_arch
 		gzip -c /var/log/syslog/remote.log > /var/log/syslog/$nuevo_arch
		rm -fr /var/log/syslog/remote.log
		echo "generacion nuevo archivo" > /var/log/syslog/remote.log
		systemctl restart rsyslog.service
	else 
		nuevo_arch=$arch$numero.gz
		gzip -c /var/log/syslog/remote.log > /var/log/syslog/$nuevo_arch
		rm -fr /var/log/syslog/remote.log
                echo "generacion nuevo archivo" > /var/log/syslog/remote.log
		systemctl restart rsyslog.service
fi 

#if [!$ult_arch_mod | $ult_arch_mod==""]
#then 
#     gzip -c $arch_log > $arch_log$numero+1.gz
#     rm -fr $arch_log
#fi
