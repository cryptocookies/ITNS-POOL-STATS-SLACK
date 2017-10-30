# ITNS-POOL-STATS-SLACK

##This script needs to be ran on a cron##

It is recomended to be ran once per minute.

>* * * * * bash /Path/Too/slackstats.sh

The default directory to pass the HTML file to is >/var/www/html

#Using with Slack

To use this in slack you must create a slack command that calls the HTML file. This must be done over HTTPS so an SSL cert will be needed. 

![ITNS SLACK](https://i.imgur.com/EZieGfl.png)

