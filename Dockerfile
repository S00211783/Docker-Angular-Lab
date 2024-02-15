# angular version = 16
# Get your appname from the package-lock.json file of you angular project

# Stage 1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build  --prod
# Stage 2
FROM nginx:alpine
COPY --from=node /app/dist/docker-angular /usr/share/nginx/html
