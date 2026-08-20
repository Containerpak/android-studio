FROM ghcr.io/containerpak/gtk3:main

LABEL org.opencontainers.image.source="https://github.com/Containerpak/android-studio"

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates libasound2t64 libnss3 libxi6 libxrender1 libxss1 libxtst6 xdg-utils && \
    mkdir -p /usr/share/icons/hicolor/scalable/apps && \
    ln -sf /android-studio/bin/studio.sh /usr/bin/android-studio && \
    ln -sf /android-studio/bin/studio.svg /usr/share/icons/hicolor/scalable/apps/android-studio.svg && \
    cpak-clean-junk

COPY android-studio.desktop /usr/share/applications/android-studio.desktop
