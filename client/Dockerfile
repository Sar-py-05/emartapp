FROM nginx:alpine

COPY client/dist/client /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

# Build Angular Application inside Remote Server
# cd client
# npm install
# npm run build

# This generates the production build inside:
# client/dist/client
# Build Docker Image - docker build -t emartapp:v1 .
# Run Container - docker run -d -p 80:80 --name emart-container emartapp:v1
# Access Application - Open the EC2 public IP in browser: http://<EC2_PUBLIC_IP>


