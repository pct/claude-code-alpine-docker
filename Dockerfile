FROM node:alpine
RUN apk add --no-cache bash git curl wget build-base python3 py3-pip && \
    curl -fsSL https://claude.ai/install.sh | bash && \
    adduser -D claude && \
    mkdir -p /work && \
    chown claude:claude /work
USER claude
ENTRYPOINT ["claude", "--dangerously-skip-permissions"]
