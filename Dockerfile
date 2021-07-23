# BASE IMAGE
FROM node:15

# SET WORKING DIR
WORKDIR /app

# COPY DEPENDECIES
COPY package*.json ./

# INSTALL DEPENDECIES
ARG NODE_ENV
RUN if [ "live" == "dev" ];     then npm i;     else npm i --only=live;     fi

# COPY CODE TO CONTAINER
COPY . ./

#ENV VARIABLE
ENV PORT=3000

# EXPOSE PORT
EXPOSE $PORT

# RUN CONTAINER
CMD [ "node", "index.js" ]