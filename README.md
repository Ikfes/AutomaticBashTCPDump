# AutomaticBashTCPDump

Requires tcpdump installed in the system.

You are meant to run this bash in screen session or in background and leave it running. Interface name eth0 needs to match your WAN main interface name, so eth0, ens3, eth0:0, etc.. Change it to both lines 2 and 11 if required.

 -gt 30000 is the amount of PPS it requires to see in order to start the tcpdump command. Change this to high enough, so that it wont start from normal traffic.
 
 -c 20000 is the amount of packets that tcpdump will capture before ending the process. Default value -c 20000 is about 5-30MB .pcap file.

You can autostart this by adding following cron job: 
@reboot screen -dmS capture /path/to/file/capture.sh

Above needs screen package installed in the system.
