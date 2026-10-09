#Building the artifacts
FROM node:14 AS ui-build
WORKDIR /usr/src/app
COPY client/ ./client/
RUN cd client && npm install && npm run build

FROM node:14 AS server-build
WORKDIR /usr/src/app
COPY nodeapi/ ./nodeapi/
RUN cd nodeapi && npm install


#Copy the build outputs to replace the default nginx contents.
FROM node:14
WORKDIR /usr/src/app/
COPY --from=server-build /usr/src/app/nodeapi/ ./
COPY --from=ui-build /usr/src/app/client/dist ./client/dist
RUN ls

#expose port 4200 for angular and 5000 for node api
EXPOSE 4200
EXPOSE 5000
CMD ["/bin/sh", "-c", "cd /usr/src/app/ && npm start"]
