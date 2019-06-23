FROM node:alpine as builder
WORKDIR app
COPY . .
RUN npm install
CMD ["npm","run","build"]

FROM nginx:alpine
WORKDIR /usr/share/nginx/html
COPY --from=builder build .
