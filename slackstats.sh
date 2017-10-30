#Network Stats
echo '><http://intensecoin.com|*Network Stats*>' > /var/www/html/slack.html
echo *Network Difficulty:* $((`curl http://77.95.32.60:8117/stats | grep -o -P ':{"difficulty":.{0,10}' | grep -o '[0-9]*'` )) >> /var/www/html/slack.html
echo *Network Hashrate:* $((`curl http://77.95.32.60:8117/stats | grep -o -P ':{"difficulty":.{0,10}' | grep -o '[0-9]*'` /120 /1000 ))Kh/s >> /var/www/html/slack.html

echo >> /var/www/html/slack.html

#Intense Pool
echo '><http://Intensepool.net|*Intense Pool*>'  >> /var/www/html/slack.html
echo *Hashrate:* $((`curl http://77.95.32.60:8117/stats | grep -o -P ',"hashrate":.{0,5}' | grep -o '[0-9]*'` / 1000 + 1))Kh/s >> /var/www/html/slack.html
echo *Active Miners:* $((`curl http://77.95.32.60:8117/stats | grep -o -P ',"miners":.{0,5}' | grep -o '[0-9]*'` )) >> /var/www/html/slack.html
############ Block Last Found ############
date=`curl http://77.95.32.60:8117/stats?_=TIMESTAMP | grep -o -P '"stats":{"lastBlockFound"''.{0,12}' | grep -o '[0-9]*'`
formatdate=`printf '%(%c)T\n' $date`
todaysdate=`date`
seconds=`printf "%s\n" $(( $(date -d "$formatdate" "+%s") - $(date -d "$todaysdate" "+%s") ))`
echo *Block Last Found:* $((`echo $seconds | sed 's/-//g'` / 60 )) Minutes Ago >> /var/www/html/slack.html 
#########################################
echo "*Pool Fees:* 0%" >> /var/www/html/slack.html 
echo >> /var/www/html/slack.html

#Official Pool
echo '><http://Intensecoin.com/pool|*Official Pool*>' >> /var/www/html/slack.html
echo *Hashrate:* $((`curl http://45.32.171.89:8111/stats | grep -o -P ',"hashrate":.{0,5}' | grep -o '[0-9]*'` / 100 + 1))Kh/s >> /var/www/html/slack.html
echo *Active Miners:* $((`curl http://45.32.171.89:8111/stats | grep -o -P ',"miners":.{0,5}' | grep -o '[0-9]*'` )) >> /var/www/html/slack.html
############ Block Last Found ############
date=`curl http://45.32.171.89:8111/stats?_=TIMESTAMP | grep -o -P '"stats":{"lastBlockFound"''.{0,12}' | grep -o '[0-9]*'`
formatdate=`printf '%(%c)T\n' $date`
todaysdate=`date`
seconds=`printf "%s\n" $(( $(date -d "$formatdate" "+%s") - $(date -d "$todaysdate" "+%s") ))`
echo *Block Last Found:* $((`echo $seconds | sed 's/-//g'` / 60 )) Minutes Ago >> /var/www/html/slack.html 
#########################################
echo "*Pool Fees:* 1.25%" >> /var/www/html/slack.html 
echo >> /var/www/html/slack.html

#Hashvault Pro
echo '><https://intense.hashvault.pro/|*HashVault Pro*>' >> /var/www/html/slack.html
echo *Hashrate:* $((`curl https://intense.hashvault.pro/api/stats | grep -o -P ',"hashrate":.{0,5}' | grep -o '[0-9]*'` / 1000 + 1))Kh/s >> /var/www/html/slack.html
echo *Active Miners:* $((`curl https://intense.hashvault.pro/api/stats | grep -o -P ',"miners":.{0,5}' | grep -o '[0-9]*'` )) >> /var/www/html/slack.html
############ Block Last Found ############
date=`curl https://intense.hashvault.pro/api/stats?_=TIMESTAMP | grep -o -P '"stats":{"lastBlockFound"''.{0,12}' | grep -o '[0-9]*'`
formatdate=`printf '%(%c)T\n' $date`
todaysdate=`date`
seconds=`printf "%s\n" $(( $(date -d "$formatdate" "+%s") - $(date -d "$todaysdate" "+%s") ))`
echo *Block Last Found:* $((`echo $seconds | sed 's/-//g'` / 60 )) Minutes Ago >> /var/www/html/slack.html 
#########################################
echo "*Pool Fees:* 0.9%" >> /var/www/html/slack.html 
echo >> /var/www/html/slack.html

#MineXMR 
echo '><http://intense.myxmr.org|*MyXMR*>' >> /var/www/html/slack.html
echo *Hashrate:* $((`curl http://intense.myxmr.org:8117/stats | grep -o -P ',"hashrate":.{0,5}' | grep -o '[0-9]*'` / 1000))Kh/s >> /var/www/html/slack.html
echo *Active Miners:* $((`curl http://intense.myxmr.org:8117/stats | grep -o -P ',"miners":.{0,5}' | grep -o '[0-9]*'` )) >> /var/www/html/slack.html
############ Block Last Found ############
date=`curl http://intense.myxmr.org:8117/stats?_=TIMESTAMP | grep -o -P '"stats":{"lastBlockFound"''.{0,12}' | grep -o '[0-9]*'`
formatdate=`printf '%(%c)T\n' $date`
todaysdate=`date`
seconds=`printf "%s\n" $(( $(date -d "$formatdate" "+%s") - $(date -d "$todaysdate" "+%s") ))`
echo *Block Last Found:* $((`echo $seconds | sed 's/-//g'` / 60 )) Minutes Ago >> /var/www/html/slack.html 
#########################################
echo "*Pool Fees:* 0.5%" >> /var/www/html/slack.html 

#Footer
echo '>_App created by @james.dawson_' >> /var/www/html/slack.html


