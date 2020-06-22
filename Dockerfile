FROM consol/omd-labs-ubuntu:latest
ENV NEW_SITENAME=monitoring 
RUN echo "export SITENAME=$NEW_SITENAME" > .sitename.env && echo "RESTORE new site:$NEW_SITENAME" && omd -f rm demo &&  omd create -u 1001 -g 1001 $NEW_SITENAME || true
RUN apt update
RUN apt install libnet-dns-perl sipsak sendmail sasl2-bin -y
RUN mkdir -p /usr/local/nagios/libexec/traffic/; chown -R monitoring:monitoring  /usr/local/nagios
ADD dockerscriptetchosts.sh /home/dockerscriptetchosts.sh
RUN  echo "monitoring ALL=NOPASSWD:/usr/sbin/sendmail" | (sudo su -c 'EDITOR="tee" visudo -f /etc/sudoers.d/sm')
RUN mkdir -p /etc/mail/certs; chmod 700 /etc/mail/certs
ADD dsa1024.pem mycert.pem mykey.pem /etc/mail/certs/
RUN chmod 600 /etc/mail/certs/*; ln -s /etc/mail/mycert.pem /etc/mail/CAcert.pem
RUN mkdir -p /etc/mail/auth; chmod 700 /etc/mail/auth
ADD client-info.db /etc/mail/auth/
ADD submit.mc sendmail.mc /etc/mail/
RUN make -C /etc/mail/
RUN sed -i '2s/^/source \/home\/dockerscriptetchosts.sh\n/' ~/start.sh
