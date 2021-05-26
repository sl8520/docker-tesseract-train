FROM ubuntu:18.04

# 安裝所需套件
RUN apt-get update && apt-get install -y --no-install-recommends \
  build-essential \
  wget \
  zip \
  unzip \
  bc \
  libtool \
  automake \
  pkg-config \
  libicu-dev \
  libpango1.0-dev \
  libcairo2-dev \
  libpng-dev \
  libtiff5-dev \
  libwebp-dev \
  libopenjp2-7-dev \
  libgif-dev \
  && rm -rf /var/lib/apt/lists/*

# Install Python
RUN apt-get update && \
  apt-get install -y software-properties-common && \
  add-apt-repository ppa:deadsnakes/ppa && \
  apt-get update -y && \
  apt-get install -y python3.6 python3.6-dev python3-pip && \
  # update pip
  python3.6 -m pip install pip --upgrade && \
  python3.6 -m pip install wheel \
  && rm -rf /var/lib/apt/lists/*

# tesstrain commit 40334e4e8abc6ea793e481b21bcd8e076fa7a8ba
COPY tesstrain-master.zip /data_save/tesstrain-master.zip

RUN unzip /data_save/tesstrain-master.zip -d /data_save && \
  rm -f /data_save/tesstrain-master.zip  && \
  cd /data_save/tesstrain-master && \
  pip install -r requirements.txt  && \
  make leptonica tesseract

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/bin/bash"]
