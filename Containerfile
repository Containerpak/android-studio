FROM ubuntu:26.04 AS source

ADD --checksum=sha256:5bd5ee5d6e747b13f82fba3241380bd358cc2f4a847815c8e860757df13dc35f https://dl.google.com/dl/android/studio/ide-zips/2026.1.3.8/android-studio-quail3-patch1-linux.tar.gz /tmp/app.tar.gz

RUN mkdir -p /out && \
    tar -xzf /tmp/app.tar.gz --strip-components=1 -C /out

FROM ghcr.io/containerpak/gtk3:main

LABEL org.opencontainers.image.source="https://github.com/Containerpak/android-studio"

COPY --from=source /out /opt/android-studio

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates libasound2t64 libnss3 libxi6 libxrender1 libxss1 libxtst6 xdg-utils && \
    ln -sf /opt/android-studio/bin/studio.sh /usr/bin/android-studio && \
    cpak-clean-junk

COPY icon.png /usr/share/icons/hicolor/128x128/apps/android-studio.png
COPY android-studio.desktop /usr/share/applications/android-studio.desktop
