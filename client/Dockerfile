# Stage 1: Build Angular inside a temporary container
FROM node:14-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build -- --prod

# Stage 2: Copy built assets to Nginx
FROM nginx:alpine
COPY --from=builder /app/dist/client /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]


