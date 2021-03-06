# pull official base image
FROM node:13.12.0-alpine

# set working directory
WORKDIR /portfolio-app

# add `/portfolio-app/node_modules/.bin` to $PATH
ENV PATH /portfolio-app/node_modules/.bin:$PATH

# install app dependencies
COPY ./portfolio-app/package.json ./
COPY ./portfolio-app/package-lock.json ./
RUN npm install --silent
RUN npm install react-scripts@3.4.1 -g --silent

# add app
COPY . ./

# start app
CMD ["npm", "start"]