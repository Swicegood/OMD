/usr/bin/perl omd/sites/monitoring/local/lib/monitoring-plugins/notify-by-email.pl \
--template=/omd/sites/monitoring/etc/mail-templates/notify-by-email.host.html.tpl \
--mail=/usr/sbin/sendmail \
--mailvar='-Am \
-f jguru108@gmail.com' \
-o BASEURL="https://omd.newgoloka.local/monitoring/" \
-o NOTIFICATIONTYPE='$NOTIFICATIONTYPE$' \
-o NOTIFICATIONCOMMENT='$NOTIFICATIONCOMMENT$' \
-o HOSTNAME='$HOSTNAME$' \
-o HOSTALIAS='$HOSTALIAS$' \
-o HOSTSTATE='$HOSTSTATE$' \
-o CONTACTEMAIL='$CONTACTEMAIL$' \
-o HOSTADDRESS='$HOSTADDRESS$' \
-o SHORTDATETIME='$SHORTDATETIME$' \
-o HOSTOUTPUT='$HOSTOUTPUT$' \
-o LONGHOSTOUTPUT='$LONGHOSTOUTPUT$' \
-o HOSTPERFDATA='$HOSTPERFDATA$' \
-o ACKAUTHOR='$HOSTACKAUTHOR$' \
-o ACKCOMMENT='$HOSTACKCOMMENT$' \
-o DURATION='$HOSTDURATION$' \
-o HOSTEVENTID='$HOSTEVENTID$' \
-o LASTHOSTEVENTID='$LASTHOSTEVENTID$'
