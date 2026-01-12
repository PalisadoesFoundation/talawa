FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
# Fail the layer if any command in a pipe fails (e.g., `yes | sdkmanager ...`)
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update && apt-get install -y \
    --no-install-recommends \
    curl \
    git \
    unzip \
    xz-utils \
    zip \
    libglu1-mesa \
    openjdk-17-jdk \
    wget \
    && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH="$PATH:$JAVA_HOME/bin"

ENV ANDROID_SDK_ROOT=/opt/android-sdk
# cmdline-tools version 13.0 (build 13114758) - latest stable as of Dec 2024
RUN mkdir -p ${ANDROID_SDK_ROOT}/cmdline-tools
WORKDIR ${ANDROID_SDK_ROOT}/cmdline-tools
RUN wget -O cmdline-tools.zip \
    https://dl.google.com/android/repository/commandlinetools-linux-13114758_latest.zip && \
    unzip -q cmdline-tools.zip && \
    rm cmdline-tools.zip && \
    mv cmdline-tools latest && \
    yes | ${ANDROID_SDK_ROOT}/cmdline-tools/latest/bin/sdkmanager --licenses || true && \
    yes | ${ANDROID_SDK_ROOT}/cmdline-tools/latest/bin/sdkmanager --install "platform-tools" "platforms;android-35" "build-tools;35.0.0" || true

ENV PATH="${ANDROID_SDK_ROOT}/cmdline-tools/latest/bin:${ANDROID_SDK_ROOT}/platform-tools:${PATH}"

ENV FLUTTER_SDK=/flutter
RUN git clone --depth 1 --branch 3.32.8 https://github.com/flutter/flutter.git "$FLUTTER_SDK"

RUN $FLUTTER_SDK/bin/flutter precache --android
RUN yes | $FLUTTER_SDK/bin/flutter doctor --android-licenses || true

ENV PATH="$FLUTTER_SDK/bin:$PATH"

RUN $FLUTTER_SDK/bin/flutter config --no-analytics

RUN useradd -m -s /bin/bash flutteruser && \
    chown -R flutteruser:flutteruser $FLUTTER_SDK ${ANDROID_SDK_ROOT}
USER flutteruser
WORKDIR /home/flutteruser/app

COPY --chown=flutteruser:flutteruser . .

RUN for i in 1 2 3; do \
      flutter pub get && break; \
      echo "flutter pub get failed (attempt $i/3)"; \
      sleep $((i*5)); \
    done || (echo "flutter pub get failed after 3 attempts" && exit 1)

CMD ["tail", "-f", "/dev/null"]