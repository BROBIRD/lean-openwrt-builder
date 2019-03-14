The builder for https://github.com/coolsnowwolf/lede

为https://github.com/coolsnowwolf/lede 项目制作的构建编译工具

```
docker build github.com/BROBIRD/lean-openwrt-builder
docker run -it -v /home/lede_output:/lede/bin lean-openwrt-builder:latest
```

```
make menuconfig

...

make -j1 V=s
```

**参考**

https://github.com/timiil/lede-builder

https://github.com/timiil/coolsnowwolf-lede-builder
