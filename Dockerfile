# pull official base image
FROM node:15.10.0-alpine3.10

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# installs app deps
COPY package.json ./
COPY package-lock.json ./
RUN npm install
RUN npm install react-scripts@4.0.3 -g

# add app
COPY . ./

# start app
CMD ["npm", "start"]
