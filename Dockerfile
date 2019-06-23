FROM node:alpine as builder
WORKDIR app
COPY . .
RUN npm rebuild -g
RUN npm install
CMD ["npm","run","build"]

FROM nginx:alpine
COPY --from=builder build /usr/share/nginx/html/
