FROM node:alpine
RUN apk add --no-cache bash git curl wget build-base python3 py3-pip jq libgcc libstdc++ ripgrep
RUN adduser -D claude && \
    mkdir -p /work && \
    chown claude:claude /work
USER claude
ENV PATH="/home/claude/.bun/bin:/home/claude/.local/bin:${PATH}" \
    USE_BUILTIN_RIPGREP=0
RUN curl -fsSL https://claude.ai/install.sh | bash && \
    curl -fsSL https://bun.sh/install | bash

# Install official plugins
RUN claude plugin marketplace add anthropics/claude-plugins-official && \
    claude plugin marketplace add Dammyjay93/claude-design-engineer && \
    claude plugin marketplace update && \
    claude plugin install agent-sdk-dev && \
    claude plugin install claude-code-setup && \
    claude plugin install claude-md-management && \
    claude plugin install code-review && \
    claude plugin install code-simplifier && \
    claude plugin install commit-commands && \
    claude plugin install context7 && \
    claude plugin install explanatory-output-style && \
    claude plugin install feature-dev && \
    claude plugin install frontend-design && \
    claude plugin install greptile && \
    claude plugin install hookify && \
    claude plugin install playwright && \
    claude plugin install pr-review-toolkit && \
    claude plugin install ralph-loop && \
    claude plugin install security-guidance && \
    claude plugin install superpowers && \
    claude plugin install typescript-lsp

ENTRYPOINT ["claude", "--dangerously-skip-permissions"]
