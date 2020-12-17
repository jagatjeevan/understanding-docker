FROM node:current-alpine3.10 as builder
WORKDIR /app
COPY ./package.json ./
RUN ["npm", "install"]
COPY ./ ./
RUN npm run build

FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html