FROM node:20-alpine AS builder

WORKDIR /app

COPY package*.json ./

RUN npm ci && npm cache clean --force

COPY . .

ARG VITE_ENV_CACHE_BUST=""
RUN --mount=type=secret,id=vite_env,target=/app/.env,required=false \
    sh -c "echo \"$VITE_ENV_CACHE_BUST\" >/dev/null && npm run build"

FROM nginx:alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=builder /app/dist /usr/share/nginx/html
COPY docker-entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost/ || exit 1

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
