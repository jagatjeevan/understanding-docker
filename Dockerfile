FROM node:current-alpine3.10
WORKDIR /app
COPY ./package*.json ./
RUN ["npm", "install"]
COPY ./ ./
RUN npm run test -- --coverage --watchAll=false
RUN npm run build

FROM nginx:alpine
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
