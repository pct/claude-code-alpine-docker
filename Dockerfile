FROM node:alpine
RUN apk add --no-cache bash git curl wget build-base python3 py3-pip && \
    npm i -g @anthropic-ai/claude-code && \
    adduser -D claude && \
    mkdir -p /work && \
    chown claude:claude /work
USER claude
ENTRYPOINT ["claude", "--dangerously-skip-permissions"]