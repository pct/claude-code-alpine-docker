FROM node:alpine
ENV PATH="/root/.local/bin:${PATH}"
RUN apk add --no-cache bash git curl wget build-base python3 py3-pip
RUN curl -fsSL https://claude.ai/install.sh | bash
RUN adduser -D claude && \
    mkdir -p /work && \
    chown claude:claude /work
USER claude
ENTRYPOINT ["claude", "--dangerously-skip-permissions"]
