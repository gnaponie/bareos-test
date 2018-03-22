
FROM fedora:26


ENV URL http://download.bareos.org/bareos/release/latest/Fedora_26
RUN dnf -y update && \
    dnf -y install wget

RUN wget -O /etc/yum.repos.d/bareos.repo $URL/bareos.repo 

# installing bareos and postgresql
RUN dnf install -y bareos-client postgresql && \
    dnf clean all

# copying the bash script
COPY conf_script.sh /
ENTRYPOINT /conf_script.sh

# copying the configurations
COPY bareos-fd.conf /etc/bareos/bareos-fd.conf 
RUN chown root:bareos /etc/bareos/bareos-fd.conf 
RUN chmod 777 /etc/bareos/bareos-fd.conf
#RUN chmod a+r /etc/bareos/bareos-fd.conf
