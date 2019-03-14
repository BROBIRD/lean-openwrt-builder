FROM ubuntu:18.10
MAINTAINER brobirdcn@gmail.com

RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch unzip zlib1g-dev && \
  apt-get install -y lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp && \
  apt-get install -y libssl-dev texinfo libglib2.0-dev && \
  apt-get install -y wget curl nano && \
  rm -rf /var/lib/apt/lists/* 
  
  git clone https://github.com/coolsnowwolf/lede.git && \
  git clone https://github.com/Zy143L/CloudXNS.git && \
  mv ./CloudXNS/luci-app-cloudxns ./lede/package/lean/luci-app-cloudxns && \
  cd lede && \
  ./scripts/feeds update -a && \
  ./scripts/feeds install -a

WORKDIR /lede

ENV FORCE_UNSAFE_CONFIGURE 1
