FROM consol/omd-labs-ubuntu:v3.30
ENV NEW_SITENAME=monitoring 
RUN echo "export SITENAME=$NEW_SITENAME" > .sitename.env && echo "RESTORE new site:$NEW_SITENAME" && omd -f rm demo &&  omd create -u 1001 -g 1001 $NEW_SITENAME || true
RUN mkdir -p /etc/apt/trusted.gpg.d \
  && curl -fsSL "https://labs.consol.de/repo/stable/monitoring-repo-consol-de-gpg-2026.asc" -o /etc/apt/trusted.gpg.d/monitoring-repo-consol-de-gpg-2026.asc
RUN apt update
RUN apt install -y ca-certificates curl gnupg apt-transport-https && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /etc/apt/keyrings \
  && curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /etc/apt/keyrings/cloud.google.gpg \
  && echo "deb [signed-by=/etc/apt/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" > /etc/apt/sources.list.d/google-cloud-sdk.list
RUN apt update && apt install -y google-cloud-cli && rm -rf /var/lib/apt/lists/*
RUN apt update
RUN apt install libnet-dns-perl sipsak sendmail sasl2-bin -y
RUN apt install -y cpanminus
RUN cpanm --force Telephony::Asterisk::AMI
RUN mkdir -p /usr/local/nagios/libexec/traffic/; chown -R monitoring:monitoring  /usr/local/nagios
ADD dockerscriptetchosts.sh /home/dockerscriptetchosts.sh
ADD cleanup-apache-pid.sh /home/cleanup-apache-pid.sh
RUN chmod +x /home/cleanup-apache-pid.sh
RUN  echo "monitoring ALL=NOPASSWD:/usr/sbin/sendmail" | (sudo su -c 'EDITOR="tee" visudo -f /etc/sudoers.d/sm')
RUN mkdir -p /etc/mail/certs; chmod 700 /etc/mail/certs
ADD dsa1024.pem mycert.pem mykey.pem /etc/mail/certs/
RUN chmod 600 /etc/mail/certs/*; ln -s /etc/mail/mycert.pem /etc/mail/CAcert.pem
RUN mkdir -p /etc/mail/auth; chmod 700 /etc/mail/auth
ADD auth/client-info.db /etc/mail/auth/
ADD submit.mc sendmail.mc /etc/mail/
RUN m4 /etc/mail/sendmail.mc > /etc/mail/sendmail.cf && m4 /etc/mail/submit.mc > /etc/mail/submit.cf
RUN sed -i '2s/^/source \/home\/cleanup-apache-pid.sh\nsource \/home\/dockerscriptetchosts.sh\n/' ~/start.sh
