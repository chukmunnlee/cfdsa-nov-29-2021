FROM node:17
## build

ARG APP_DIR=/app

WORKDIR ${APP_DIR}

# copy files from local into the image
ADD main.js .
ADD package.json .
ADD package-lock.json .
ADD public public
ADD views views

# install dependencies
RUN npm ci

# run 
ENV APP_DIR=/app
ENV PORT=3000

# what are the required ports
EXPOSE ${PORT}

# run the app
ENTRYPOINT [ "node", "main" ]

#CMD [ "--port", "3000" ]