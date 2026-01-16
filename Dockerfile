FROM node:alpine
RUN apk add --no-cache bash git curl wget build-base python3 py3-pip
RUN adduser -D claude && \
    mkdir -p /work && \
    chown claude:claude /work
USER claude
ENV PATH="/home/claude/.bun/bin:/home/claude/.local/bin:${PATH}"
RUN curl -fsSL https://claude.ai/install.sh | bash && \
    curl -fsSL https://bun.sh/install | bash

# Install official plugins
RUN claude plugin install agent-sdk-dev && \
    claude plugin install code-review && \
    claude plugin install commit-commands && \
    claude plugin install context7 && \
    claude plugin install feature-dev && \
    claude plugin install figma && \
    claude plugin install frontend-design && \
    claude plugin install greptile && \
    claude plugin install jdtls-lsp && \
    claude plugin install playwright && \
    claude plugin install plugin-dev && \
    claude plugin install pr-review-toolkit && \
    claude plugin install security-guidance && \
    claude plugin install typescript-lsp

# Install ralph-loop plugin (requires marketplace update first)
RUN claude plugin marketplace update && \
    claude plugin install ralph-loop

ENTRYPOINT ["claude", "--dangerously-skip-permissions"]
