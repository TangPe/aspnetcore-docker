#Azure CDN加速
FROM mcr.microsoft.com/dotnet/aspnet:6.0-bullseye-slim AS base
# 设置默认时区
ENV TZ=Asia/Shanghai

# 使用网易 apt 源
RUN sed -i "s@/archive.ubuntu.com/@/mirrors.163.com/@g" /etc/apt/sources.list \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get update --fix-missing -o Acquire::http::No-Cache=True

# 安装libgdiplus库，用于Excel导出
RUN apt-get update && apt-get install -y apt-utils libgdiplus libc6-dev

# 安装fontconfig库，用于Pdf导出
RUN apt-get update && apt-get install -y fontconfig
COPY /simsun.ttc /usr/share/fonts/simsun.ttc

# 添加阿里巴巴普惠体
COPY /AlibabaPuHuiTi-2-55-Regular.otf /usr/share/fonts/AlibabaPuHuiTi-2-55-Regular.otf

WORKDIR /app
EXPOSE 80
EXPOSE 443