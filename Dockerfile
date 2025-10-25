FROM node:alpine
RUN npm i -g @anthropic-ai/claude-code
ENTRYPOINT ["claude", "--dangerously-skip-permissions"]