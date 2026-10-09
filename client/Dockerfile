# Stage 1: Build Angular
FROM node:14 AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN ./node_modules/.bin/ng build --prod --build-optimizer=false
# This line lists the files so we can read them in the logs
RUN ls -la && ls -la dist/

# Stage 2: Copy built assets to Nginx
FROM nginx:alpine
COPY --from=builder /app/dist/client /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
