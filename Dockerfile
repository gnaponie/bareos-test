
FROM fedora:26

ENV URL http://download.bareos.org/bareos/release/latest/Fedora_26
RUN dnf -y update && \
    dnf -y install wget

RUN wget -O /etc/yum.repos.d/bareos.repo $URL/bareos.repo 

# installing bareos and postgresql
RUN dnf install -y bareos-client postgresql && \
    dnf clean all

# copying the configurations
COPY bareos-fd.conf /etc/bareos/bareos-fd.conf 
RUN chown root:bareos /etc/bareos/bareos-fd.conf 
RUN chmod ugo+rw /etc/bareos/bareos-fd.conf
RUN chmod -R ugo+rw /etc/bareos
RUN chown -R root:bareos /var/lib/bareos
RUN chmod -R ugo+rw /var/lib/bareos

# copying the bash script
COPY conf_script.sh /
ENTRYPOINT /conf_script.sh
