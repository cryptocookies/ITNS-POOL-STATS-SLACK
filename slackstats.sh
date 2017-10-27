#Pool Stats
echo *Intensepool.net*  > /var/www/html/slack.html
echo  >> /var/www/html/slack.html
echo *Hashrate:* $((`curl http://77.95.32.60:8117/stats | grep -o -P ',"hashrate":.{0,5}' | grep -o '[0-9]*'` / 1000 + 1))Kh/s >> /var/www/html/slack.html
echo *Active Miners:* $((`curl http://77.95.32.60:8117/stats | grep -o -P ',"miners":.{0,5}' | grep -o '[0-9]*'` )) >> /var/www/html/slack.html
echo *Network Difficulty:* $((`curl http://77.95.32.60:8117/stats | grep -o -P ':{"difficulty":.{0,10}' | grep -o '[0-9]*'` )) >> /var/www/html/slack.html
############ Block Last Found ############
date=`curl http://77.95.32.60:8117/stats?_=TIMESTAMP | grep -o -P '"stats":{"lastBlockFound"''.{0,12}' | grep -o '[0-9]*'`
formatdate=`printf '%(%c)T\n' $date`
todaysdate=`date`
seconds=`printf "%s\n" $(( $(date -d "$formatdate" "+%s") - $(date -d "$todaysdate" "+%s") ))`
echo *Block Last Found:* $((`echo $seconds | sed 's/-//g'` / 60 )) Minutes Ago >> /var/www/html/slack.html 
#################################

echo "------------------------" >> /var/www/html/slack.html

echo *intensecoin.com* >> /var/www/html/slack.html
echo >> /var/www/html/slack.html
echo *Hashrate:* $((`curl http://45.32.171.89:8111/stats | grep -o -P ',"hashrate":.{0,5}' | grep -o '[0-9]*'` / 100 + 1))Kh/s >> /var/www/html/slack.html
echo *Active Miners:* $((`curl http://45.32.171.89:8111/stats | grep -o -P ',"miners":.{0,5}' | grep -o '[0-9]*'` )) >> /var/www/html/slack.html
echo *Network Difficulty:* $((`curl http://45.32.171.89:8111/stats | grep -o -P ':{"difficulty":.{0,10}' | grep -o '[0-9]*'` )) >> /var/www/html/slack.html
############ Block Last Found ############
date=`curl http://45.32.171.89:8111/stats?_=TIMESTAMP | grep -o -P '"stats":{"lastBlockFound"''.{0,12}' | grep -o '[0-9]*'`
formatdate=`printf '%(%c)T\n' $date`
todaysdate=`date`
seconds=`printf "%s\n" $(( $(date -d "$formatdate" "+%s") - $(date -d "$todaysdate" "+%s") ))`
echo *Block Last Found:* $((`echo $seconds | sed 's/-//g'` / 60 )) Minutes Ago >> /var/www/html/slack.html 
#################################

