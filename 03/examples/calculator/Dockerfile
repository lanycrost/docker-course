FROM node:15.10 as build-env
WORKDIR /app
# Copy package.json and install dependencies
COPY package.json ./
RUN npm install
ENV PATH=/app/node_modules/.bin:$PATH \
  PUBLIC_URL=//192.168.33.12/
COPY . /app
# build ReactJS project
RUN npm run build

# Build runtime image
FROM nginx:1.18.0
COPY --from=build-env /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
