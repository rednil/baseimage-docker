FROM phusion/baseimage:0.9.16
MAINTAINER Christian Linder <rednil@onyown.de>

ADD filesystem /

RUN build.sh

CMD ["/sbin/my_init"]
