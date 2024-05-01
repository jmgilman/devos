ARG SOURCE_IMAGE="bluefin"
ARG SOURCE_SUFFIX="-dx"
ARG SOURCE_TAG="40"

FROM ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_SUFFIX}:${SOURCE_TAG}

COPY system/ /
COPY build.sh /tmp/build.sh

# Adjust authorized key file permissions
RUN chmod 0700 /usr/etc/skel/.ssh && \
    chmod 0600 /usr/etc/skel/.ssh/authorized_keys

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit
