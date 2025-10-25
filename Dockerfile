FROM node:alpine
RUN npm i -g @anthropic-ai/claude-code && \
    adduser -D claude && \
    mkdir -p /work && \
    chown claude:claude /work
USER claude
ENTRYPOINT ["claude", "--dangerously-skip-permissions"]