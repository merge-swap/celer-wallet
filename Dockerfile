FROM ubuntu:16.04
LABEL maintainer="Aviator" \
      discord="Aviator#1024"

RUN apt-get update &&\
    apt-get install -y wget libboost-system1.58.0 libboost-filesystem1.58.0 libboost-program-options1.58.0 \
    libboost-thread1.58.0 libboost-chrono1.58.0 libevent-2.0-5 libevent-pthreads-2.0-5 &&\
    wget https://github.com/CelerCoin/celer/releases/download/v.0.7.1.2/Celer-0.7.1.2-Ubuntu16.04_x64.tar.gz -O /tmp/celer.tar.gz &&\
    tar -xvzf /tmp/celer.tar.gz -C /usr/local/bin &&\
    rm /usr/local/bin/celer-qt &&\ 
    rm /usr/local/bin/celer-tx && \
    apt-get purge -y wget  &&\
    rm -rf /var/lib/apt/lists/* &&\
    apt-get clean &&\
    useradd -ms /bin/bash wallet

VOLUME ["/home/wallet/.celer"]
EXPOSE 13737/tcp 
USER wallet 
CMD celerd -printtoconsole
