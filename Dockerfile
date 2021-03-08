FROM node:alpine as builder
# FROM node:alpine 
WORKDIR '/app'
COPY package.json .
RUN npm install -g npm@7.6.0
RUN npm install 
# we just copy stuff over, since this there will be no changes -> production
COPY . . 
RUN npm run build 

FROM nginx 
COPY --from=builder /app/build /usr/share/nginx/html 
#COPY --from=0 /app/build /usr/share/nginx/html 


