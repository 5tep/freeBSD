sudo pfctl -nf /etc/pf.conf
pfctl -f /etc/pf.conf && pfctl -e
pfctl -a shaper -s rules # покажет добавленные правила.
pfctl -sr | grep 443 #(правила для HTTPS).
tcpdump -i vlan270 port 443 # должен проходить.

pfctl -t block_users -T add 1.2.3.4 # трафик на 1.2.3.4:80 → редирект на :81
pfctl -t local1 -T add 10.123.0.100 # трафик на 10.123.0.100:80 → редирект на :8877

dnctl pipe show # проверяем трафик
pfctl -a shaper -s rules # pass in/out для IP.
tail -f /var/stargazer/allconnect.log # ошибки/лог

sudo sh /etc/firewall.conf
sudo pfctl -s tables
sudo pfctl -T show -t local_nets

sh /etc/rc.local #(ручной запуск); 
ifconfig vlan270 #(alias виден?); 
ps aux | grep softflowd #(если раскомментировал).

./OnConnect testlogin 192.168.1.100 123 50
dnctl pipe show 
pfctl -a shaper -s rules.
./OnDisconnect testuser 192.168.1.100 123 50 
pfctl -si # (states должны очиститься для IP)


Сеть: ifconfig -a — ix0/ix1 up с IP, VLAN tagged. ping 85.115.202.1 (WAN), ping 10.10.10.1 (LAN).
SSH: С re0/vlan4000 (192.168.168.9) — ssh root@192.168.168.9.
MTU: ping -M do -s 8972 85.115.202.1 (для 9000 MTU; если фрагмент — верни 1500).
PF: pfctl -sr (правила), добавь тестового юзера — проверь shaping на ix1 → vlan270.

service netif restart