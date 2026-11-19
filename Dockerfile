# ---------- Stage 1: Build ----------
FROM node:20-alpine AS build
WORKDIR /app

# Abhängigkeiten zuerst installieren (Docker-Layer-Cache)
COPY package.json package-lock.json ./
RUN npm ci

COPY public ./public
COPY src ./src
RUN npm run build

# ---------- Stage 2: Runtime (statische Dateien mit nginx) ----------
FROM nginx:1.27-alpine
COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
