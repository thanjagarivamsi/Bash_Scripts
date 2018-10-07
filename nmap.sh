#!/bin/sh
clear
                            
echo " "                                                
echo "                            ██████ "
echo "                                ▓▓ "
echo " █▒██▒  ██▓█▓  ░███░  █▓██      █ "
echo " █▓ ▒█  █▒█▒█  █▒ ▒█  █▓ ▓█    ▒█ "
echo " █   █  █ █ █      █  █   █    █░ "
echo " █   █  █ █ █  ▒████  █   █   ▒█ " 
echo " █   █  █ █ █  █▒  █  █   █   █░ " 
echo " █   █  █ █ █  █░ ▓█  █▓ ▓█  ▒█ "  
echo " █   █  █ █ █  ▒██▒█  █▓██   █▒ "  
echo "                      █         "  
echo "                      █         " 
echo "                      █         " 
echo " "
while [ 1 ]; do
{
read -p "Enter an ip address to scan : " ip
echo " "

#IP ADDRESS VALIDATION
if [ -z $ip ]; then
 {
  echo "Enter correct ip address"
  echo " "
  exit
 }
fi

if fping -r 1 $ip
then
 {
  echo " "
  echo "IP validated"
  break
 }
else
 {
  echo " "
  echo "Enter correct ip address"
  echo " "
 }
fi
}
done
while [ 1 ]; do
{
echo " "
echo " Choose From The Options :- "
echo "-------------------------------------------"
echo " 1  - Basic Scan. "
echo " 2  - Open Ports Scan. "
echo " 3  - Host Scan "
echo " 4  - Exposed Netbios Servers Scan"
echo " 5  - Check If Netbios Servers Are Vulnerable To MS08-067"
echo " 6  - TCP SYN Scan"
echo " 7  - UDP Scan"
echo " 8  - Detailed Version Scan"
echo " 9  - Gather Page Titles From HTTP Services"
echo " 10 - Detect Heartbleed SSL Vulnerability Scan"
echo " 11 - Quit"
echo " "
read -p "Enter Your Choice : " option
echo " "
     case $option in
  
            1)              
              echo "Scan is on Process.....!!!!" 
              res=`nmap  $ip`
              echo "Basic Scan Completed.....!!!!!!" 
              echo "--------------------------------------------------------" 
              echo "$res" 
              echo "$res" >> result1.log 
              echo " "
              echo "Scaned data is stored in result1.log" 
              echo "!-**************************-!" 
              echo " "  ;;


            2)
              echo "Scan is on Process...........!"                
              res=`nmap --open $ip |grep "open"` 
              echo "Open Port Scan completed" 
              echo "-------------------------------------------------------" 
              echo "$res"
              echo "$res" >> result2.log
              echo  " "
              echo "Scaned data is stored in result2.log" 
              echo "!-**************************-!"  
              echo " " ;;
           3)
              echo "Scan is on Process...........!" 
              res=`nmap -sP $ip/24`
              echo "Host Scan completed" 
              echo "-------------------------------------------------------" 
              echo "$res"
              echo "$res" >> result3.log 
              echo " "
              echo "Scaned data is stored in result3.log" 
              echo "!-**************************-!"  
              echo " " ;;
           4)
              echo "Scan is on Process...........!"               
              res=`nmap -sV -v -p 139,445 $ip/24` 
              echo "Exposed Netbios Servers Scan Completed" 
              echo "-------------------------------------------------------" 
              echo "$res"
              echo "$res" >> result4.log 
              echo " "
              echo "Scaned data is stored in result4.log" 
              echo "!-**************************-!"  
              echo " " ;;
           5)
              echo "Scan is on Process...........!"  
              res=`nmap --script-args=unsafe=1 --script smb-check-vulns.nse -p 445 $ip` 
              echo "Checking If Netbios Servers Are Vulnerable To MS08-067 Completed" 
              echo "-------------------------------------------------------" 
              echo "$res"
              echo "$res" >> result5.log
              echo " "
              echo "Scaned data is stored in result5.log" 
              echo "!-**************************-!"  
              echo " " ;;
           6)
              echo "Scan is on Process...........!" 
              res=`nmap -sS $ip` 
              echo "TCP SYN Scan Completed" 
              echo "-------------------------------------------------------" 
              echo "$res"
              echo "$res" >> result6.log 
              echo " "
              echo "Scaned data is stored in result6.log" 
              echo "!-**************************-!"  
              echo " " ;;
           7)
              echo "Scan is on Process...........!"               
              res=`nmap -sU $ip ` 
              echo "UDP Scan completed" 
              echo "-------------------------------------------------------" 
              echo "$res"
              echo "$res" >> result7.log
              echo " "
              echo "Scaned data is stored in result7.log" 
              echo "!-**************************-!"  
              echo " " ;;
            8)
              echo "Scan is on Process...........!"  
              res=`nmap --version-trace $ip` 
              echo "Detailed Version Scan Completed" 
              echo "-------------------------------------------------------" 
              echo "$res"
              echo "$res" >> result8.log
              echo " "
              echo "Scaned data is stored in result8.log" 
              echo "!-**************************-!"  
              echo " " ;;
            9)
              echo "Scan is on Process...........!" 
              res=`nmap --script=http-title $ip/24` 
              echo "Gather Page Titles From HTTP Services Completed" 
              echo "-------------------------------------------------------" 
              echo "$res"
              echo "$res" >> result9.log 
              echo " "
              echo "Scaned data is stored in result9.log" 
              echo "!-**************************-!"  
              echo " " ;;
           10)
              echo "Scan is on Process...........!" 
              res=`nmap -sV -p 443 --script=ssl-heartbleed $ip/24` 
              echo "Detect Heartbleed SSL Vulnerability Scan Completed" 
              echo "-------------------------------------------------------" 
              echo "$res"
              echo "$res" >> result10.log 
              echo " "
              echo "Scaned data is stored in result10.log" 
              echo "!-**************************-!"  
              echo " " ;;
           
           11)     
              break ;;

   esac
}
done                                                                                   
