FROM ghcr.io/bluefora/workstation:latest

COPY build.sh /tmp/build.sh

COPY rootcopy /

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit
    
