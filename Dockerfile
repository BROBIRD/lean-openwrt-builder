FROM brobird/lean-openwrt-buildbase
MAINTAINER brobirdcn@gmail.com

ENV DEBIAN_FRONTEND=noninteractive FORCE_UNSAFE_CONFIGURE=1
RUN \
  git clone https://github.com/coolsnowwolf/lede.git && \
  git clone https://github.com/Zy143L/CloudXNS.git && \
  mv ./CloudXNS/luci-app-cloudxns ./lede/package/lean/luci-app-cloudxns && \
  git clone https://github.com/BROBIRD/openwrt-r8168.git && \
  mv ./openwrt-r8168 ./lede/package/lean/openwrt-r8168 && \
  cd lede && \
  ./scripts/feeds update -a && \
  ./scripts/feeds install -a && \
  wget -O ./.config https://raw.githubusercontent.com/BROBIRD/lean-openwrt-builder/master/.config &&\
  make -j$(nproc) V=s && \
  cp ./bin ../ROM && \
  make clean && \
  make dirclean && \
  make distclean && \
