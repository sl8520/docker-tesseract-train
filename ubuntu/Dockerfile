FROM ubuntu:18.04

# Set Environment Variables
ENV DEBIAN_FRONTEND noninteractive

# Install packages
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

ARG TESSTRAIN_VERSION
ENV TESSTRAIN_VERSION ${TESSTRAIN_VERSION}

WORKDIR /data_save

# Get tesstrain
RUN wget -O tesstrain-${TESSTRAIN_VERSION}.zip https://github.com/tesseract-ocr/tesstrain/archive/${TESSTRAIN_VERSION}.zip && \
  unzip tesstrain-${TESSTRAIN_VERSION}.zip && \
  rm -f tesstrain-${TESSTRAIN_VERSION}.zip && \
  mv tesstrain-${TESSTRAIN_VERSION} tesstrain && \
  cd tesstrain && \
  mkdir -p data/foo-ground-truth && \
  unzip ocrd-testset.zip -d data/foo-ground-truth && \
  pip install -r requirements.txt  && \
  make leptonica tesseract

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/bin/bash"]
