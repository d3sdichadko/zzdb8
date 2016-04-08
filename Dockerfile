FROM debian:8.3
MAINTAINER user5 <desdichadko@gmail.com>
RUN export DEBIAN_FRONTEND=noninteractive

#Make happiness
RUN echo -e "### BEGIN INIT INFO \n# Provides:          dhcpv6_hack.sh\n# Required-Start:    $remote_fs $syslog\n# Required-Stop:     $remote_fs $syslog\n# Default-Start:     2 3 4 5\n# Default-Stop:      0 1 6\n# Short-Description: Start daemon at boot time\n# Description:       Enable service provided by daemon.\n### END INIT INFO" >> /etc/init.d/dhcpv6_hack.sh
RUN echo -e "### BEGIN INIT INFO \n# Provides:          ssh_key_hack.sh\n# Required-Start:    $remote_fs $syslog\n# Required-Stop:     $remote_fs $syslog\n# Default-Start:     2 3 4 5\n# Default-Stop:      0 1 6\n# Short-Description: Start daemon at boot time\n# Description:       Enable service provided by daemon.\n### END INIT INFO" >> /etc/init.d/ssh_key_hack.sh
RUN sed -i 's/PermitRootLogin without-password/PermitRootlogin yes/g' /etc/ssh/sshd_config && systemctl restart ssh

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y iperf iptraf

#Before install vestacp
#apt-get purge exim4*

RUN touch /root/test
RUN echo Good >> /root/test

EXPOSE 22 3306
