FROM node:alpine
RUN apk add --no-cache bash git curl wget build-base python3 py3-pip
RUN adduser -D claude && \
    mkdir -p /work && \
    chown claude:claude /work
USER claude
ENV PATH="/home/claude/.bun/bin:/home/claude/.local/bin:${PATH}"
RUN curl -fsSL https://claude.ai/install.sh | bash && \
    curl -fsSL https://bun.sh/install | bash
ENTRYPOINT ["claude", "--dangerously-skip-permissions"]
