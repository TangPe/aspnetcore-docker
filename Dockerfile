#Azure CDN加速
FROM mcr.microsoft.com/dotnet/core/aspnet:2.2 AS base
# 设置默认时区
ENV TZ=Asia/Shanghai

# 安装libgdiplus库，用于Excel导出(增加无头浏览器所需库)
RUN apt-get update && apt-get install -y apt-utils libgdiplus libc6-dev libgif-dev autoconf libtool automake build-essential gettext libglib2.0-dev libcairo2-dev libtiff-dev libexif-dev && apt-get clean && ln -s /usr/lib/libgdiplus.so /usr/lib/gdiplus.dll
RUN ln -s /lib64/libdl.so.2 /lib64/libdl.so

# 安装fontconfig库，用于Pdf导出
RUN apt-get update && apt-get install -y fontconfig
COPY /simsun.ttc /usr/share/fonts/simsun.ttc

WORKDIR /app
EXPOSE 80
EXPOSE 443
