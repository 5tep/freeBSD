#NEW NAS
php /etc/rscriptd/GetMac testuser
ps aux | grep rscriptd
service stargazer status
service rscriptd status

tcpdump -i any -nn port 9999
tcpdump -i em0 -nn port 9999
netcat -l -p 9999 -v
nc -l -k -p 9999 -v
tail -f /var/log/rscriptd.log
tail -f /var/log/stargazer.log
tail -f /var/stargazer/allconnect.log

checkspeed <IP>

pfctl -t 3 -T show
pfctl -t 4 -T show

#OLD NAS

#BILLING

#BD
