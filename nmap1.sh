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

echo " "
while [ 1 ]; do
{
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

     if [ "$option" = "1" ]; then
             
          {           
              echo "Scan is on Process.....!!!!" 
              echo "press ctrl+c to stop the scan"
              res=`nmap  $ip`
              echo "Basic Scan Completed.....!!!!!!" 
              echo "--------------------------------------------------------" 
              echo "$res" 
              echo "$res" >> result1.log
              echo " "            
              echo "Scaned data is stored in result1.log" 
              echo "!-****************************************************-!" 
              echo " "
          }
     fi

     if [ "$option" = "2" ]; then 
          
          {
              echo "Scan is on Process...........!" 
              echo "press ctrl+c to stop the scan"               
              res=`nmap --open $ip | grep "open"` 
              echo "Open Port Scan completed" 
              echo "-------------------------------------------------------" 
              echo "$res"
              echo "$res" >> result2.log
              echo " " 
              echo "Scaned data is stored in result2.log" 
              echo "!-***************************************************-!"  
              echo " " 
          }

     fi
   
     if [ "$option" = "3" ]; then
           
          {
              echo "Scan is on Process...........!" 
              echo "press ctrl+c to stop the scan"
              res=`nmap -sP $ip/24`
              echo "Host Scan completed" 
              echo "-------------------------------------------------------" 
              echo "$res"
              echo "$res" >> result3.log
              echo " " 
              echo "Scaned data is stored in result3.log" 
              echo "!-***************************************************-!"  
              echo " " 
          }

     fi

     if [ "$option" = "4" ]; then

          {
              echo "Scan is on Process...........!"  
              echo "press ctrl+c to stop the scan"             
              res=`nmap -sV -v -p 139,445 $ip/24` 
              echo "Exposed Netbios Servers Scan Completed" 
              echo "-------------------------------------------------------" 
              echo "$res"
              echo "$res" >> result4.log
              echo " "  
              echo "Scaned data is stored in result4.log" 
              echo "!-***************************************************-!"  
              echo " " 
          }
     fi

     if [ "$option" = "5" ]; then
          {
              echo "Scan is on Process...........!"  
              echo "press ctrl+c to stop the scan"
              res=`nmap --script-args=unsafe=1 --script smb-check-vulns.nse -p 445 $ip` 
              echo "Checking If Netbios Servers Are Vulnerable To MS08-067 Completed" 
              echo "-------------------------------------------------------" 
              echo "$res"
              echo "$res" >> result5.log
              echo " " 
              echo "Scaned data is stored in result5.log" 
              echo "!-***************************************************-!"  
              echo " " 
          }
     fi
           
     if [ "$option" = "6" ]; then
          {
              echo "Scan is on Process...........!" 
              echo "press ctrl+c to stop the scan"
              res=`nmap -sS $ip` 
              echo "TCP SYN Scan Completed" 
              echo "-------------------------------------------------------" 
              echo "$res"
              echo "$res" >> result6.log
              echo " " 
              echo "Scaned data is stored in result6.log" 
              echo "!-***************************************************-!"  
              echo " " 
          }
     fi

     if [ "$option" = "7" ]; then
          {
              echo "Scan is on Process...........!"    
              echo "press ctrl+c to stop the scan"           
              res=`nmap -sU $ip ` 
              echo "UDP Scan completed" 
              echo "-------------------------------------------------------" 
              echo "$res"
              echo "$res" >> result7.log
              echo " " 
              echo "Scaned data is stored in result7.log" 
              echo "!-***************************************************-!"  
              echo " " 
          }  
     fi

     if [ "$option" = "8" ]; then
          {
              echo "Scan is on Process...........!"  
              echo "press ctrl+c to stop the scan"
              res=`nmap --version-trace $ip` 
              echo "Detailed Version Scan Completed" 
              echo "-------------------------------------------------------" 
              echo "$res"
              echo "$res" >> result8.log
              echo " " 
              echo "Scaned data is stored in result8.log" 
              echo "!-***************************************************-!"  
              echo " " 
          }
     fi

     if [ "$option" = "9" ]; then
          {
              echo "Scan is on Process...........!" 
              echo "press ctrl+c to stop the scan"
              res=`nmap --script=http-title $ip/24` 
              echo "Gather Page Titles From HTTP Services Completed" 
              echo "-------------------------------------------------------" 
              echo "$res"
              echo "$res" >> result9.log 
              echo " "
              echo "Scaned data is stored in result9.log" 
              echo "!-***************************************************-!"  
              echo " " 
          }
     fi

     if [ "$option" = "10" ]; then
          {
              echo "Scan is on Process...........!" 
              echo "press ctrl+c to stop the scan"
              res=`nmap -sV -p 443 --script=ssl-heartbleed $ip/24` 
              echo "Detect Heartbleed SSL Vulnerability Scan Completed" 
              echo "-------------------------------------------------------" 
              echo "$res"             
              echo "$res" >> result10.log
              echo " "  
              echo "Scaned data is stored in result10.log" 
              echo "!-***************************************************-!"  
              echo " "
          }
     fi
           
     if [ "$option" = "11" ]; then
          {
              break 
          }
     fi
}
done
                                                                                    
