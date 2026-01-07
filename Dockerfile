FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    xz-utils \
    zip \
    libglu1-mesa \
    openjdk-17-jdk \
    wget \
    qemu-kvm \
    libvirt-clients \
    libvirt-daemon-system \
    bridge-utils \
    sudo \
    && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH="$PATH:$JAVA_HOME/bin"

ENV ANDROID_SDK_ROOT=/opt/android-sdk
RUN mkdir -p ${ANDROID_SDK_ROOT}/cmdline-tools && \
    cd ${ANDROID_SDK_ROOT}/cmdline-tools && \
    wget -q https://dl.google.com/android/repository/commandlinetools-linux-13114758_latest.zip -O cmdline-tools.zip && \
    unzip cmdline-tools.zip && \
    rm cmdline-tools.zip && \
    mv cmdline-tools latest && \
    yes | ${ANDROID_SDK_ROOT}/cmdline-tools/latest/bin/sdkmanager --licenses && \
    yes | ${ANDROID_SDK_ROOT}/cmdline-tools/latest/bin/sdkmanager --install "platform-tools" "platforms;android-35" "build-tools;35.0.0"

ENV PATH="${ANDROID_SDK_ROOT}/cmdline-tools/latest/bin:${ANDROID_SDK_ROOT}/platform-tools:${PATH}"

ENV FLUTTER_SDK=/flutter
RUN git clone --depth 1 --branch stable https://github.com/flutter/flutter.git $FLUTTER_SDK \
    && cd $FLUTTER_SDK \
    && git fetch --tags \
    && git checkout 3.27.0

RUN $FLUTTER_SDK/bin/flutter precache --android
RUN yes | $FLUTTER_SDK/bin/flutter doctor --android-licenses

ENV PATH="$FLUTTER_SDK/bin:$PATH"

RUN $FLUTTER_SDK/bin/flutter config --no-analytics

RUN useradd -m -s /bin/bash flutteruser && \
    echo "flutteruser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    chown -R flutteruser:flutteruser $FLUTTER_SDK ${ANDROID_SDK_ROOT}
USER flutteruser
WORKDIR /home/flutteruser/app

COPY --chown=flutteruser:flutteruser . .

RUN flutter pub get || flutter pub get || flutter pub get

CMD ["tail", "-f", "/dev/null"]