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

$ ps aux | grep rscriptd
root    5136   0.7  0.1  37488   3792 ??  Ss   29Sep25    892:17.62 /usr/sbin/rscriptd
root    5140   0.0  0.0  24940   1580 ??  I    29Sep25      0:01.22 rscriptd: stg-exec (rscriptd)
bossim 70091   0.0  0.0  16312   1676  0  S+   11:57AM      0:00.00 grep rscriptd

$ service stargazer status
stargazer does not exist in /etc/rc.d or the local startup
directories (/usr/local/etc/rc.d)

$ sockstat -4 | grep 9999
root     rscriptd   5136  1  udp4   *:9999                *:*

$ netstat -an | grep 9999
udp4       0      0 *.9999                 *.*


tail -f /var/stargazer/allconnect.log
2025.11.25 22:48:46 DISCONNECT: ID-682;LOGIN-00683;IP-172.16.35.20;CASH-0.000000
2025.11.25 22:48:46 CONNECT: ID-682;LOGIN-00683;IP-172.16.35.20;CASH-0.000000;SPEED-110000;UPSPEED-110000
2025.11.25 22:48:52 DISCONNECT: ID-682;LOGIN-00683;IP-172.16.35.20;CASH-0.000000
2025.11.25 22:48:52 CONNECT: ID-682;LOGIN-00683;IP-172.16.35.20;CASH-0.000000;SPEED-110000;UPSPEED-110000
2025.11.25 22:50:16 DISCONNECT: ID-682;LOGIN-00683;IP-172.16.35.20;CASH-0.000000
2025.11.25 22:50:16 CONNECT: ID-682;LOGIN-00683;IP-172.16.35.20;CASH-0.000000;SPEED-110000;UPSPEED-110000
2025.11.25 22:50:35 DISCONNECT: ID-682;LOGIN-00683;IP-172.16.35.20;CASH-0.000000
2025.11.25 22:51:09 CONNECT: ID-682;LOGIN-00683;IP-172.16.35.20;CASH-0.000000;SPEED-110000;UPSPEED-110000
2025.11.26 14:33:24 CONNECT: ID-1001;LOGIN-01002;IP-172.16.36.22;CASH--700.000000;SPEED-110000;UPSPEED-110000
2025.11.27 10:36:33 CONNECT: ID-2826;LOGIN-02827;IP-172.16.43.28;CASH-700.000000;SPEED-110000;UPSPEED-110000

#BILLING

#BD
