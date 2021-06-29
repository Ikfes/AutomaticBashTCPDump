interface=eth0
dumpdir=/root/
while /bin/true; do
  pkt_old=`grep $interface: /proc/net/dev | cut -d :  -f2 | awk '{ print $2 }'`
  sleep 1
  pkt_new=`grep $interface: /proc/net/dev | cut -d :  -f2 | awk '{ print $2 }'`
  pkt=$(( $pkt_new - $pkt_old ))
  echo -ne "\r$pkt packets/s\033[0K"
  if [ $pkt -gt 30000 ]; then
    echo -e "\n`date` Under Attack. Capturing Packets..."
    sudo  tcpdump -n -i eth0 -s0 -c 20000 -w $dumpdir/dump.`date +"%Y%m%d-%H%M%S"`.pcap
    echo "`date` Packets Captured."
    sleep 300  && pkill -HUP -f /usr/sbin/tcpdump
  else
    sleep 1
  fi
done