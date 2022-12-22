FROM ruby:2.7.0 AS source-image

RUN apt update && \
    apt install -y \
    make \
    cmake \
    g++ \
    build-essential \
    libncurses-dev \
    bison \
    flex \
    libssl-dev \
    libelf-dev \
    wget \
    gcc \
    libpcap-dev \
    libncurses-dev \
    libsctp-dev \
    sudo \
    nano

FROM source-image

LABEL Author="Abdullah Manzoor"
LABEL Youtube="https://www.youtube.com/channel/UCwqTU1vhes8u5yqXyhW3xoA"
LABEL Facebook="https://www.facebook.com/Dev0ps"
LABEL Twitter="https://twitter.com/devOps_axprt"
LABEL Instagram="https://www.instagram.com/manzoor5152/"
LABEL UpWork="https://www.upwork.com/freelancers/~01affa866a06d807df?viewMode=1"
LABEL SIPPY_CUP_VERSION="0.7.2"
LABEL SIPPY_VERSION="3.6.1"

WORKDIR /opt
RUN wget https://github.com/SIPp/sipp/releases/download/v3.6.1/sipp-3.6.1.tar.gz && \
    git clone https://github.com/mojolingo/sippy_cup.git && \
    tar -zxf sipp-3.6.1.tar.gz && \
    rm -rf sipp-3.6.1.tar.gz && \
    gem install sippy_cup bundler && \
    cd sippy_cup && \
    bundle install && \
    cd ../sipp-3.6.1 && \
    ./build.sh --full && \
    ln -s /opt/sipp-3.6.1/sipp /usr/sbin
WORKDIR /root 

COPY info.sh .
RUN chmod +x info.sh

CMD ["bash","info.sh"]
