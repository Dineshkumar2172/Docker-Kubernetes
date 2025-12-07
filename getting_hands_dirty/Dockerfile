# use node base image so that the container have all the dependencies to run node js application
FROM node:14

# setting up working directory in container file system
# in which we wanna work
WORKDIR /app

# copying package.json into our working directory
COPY package.json .

# running npm install to install all dependencies on our working directory
RUN npm install

# copying all the code files into our working directory
COPY . .

# expose port 3000 on which our app is listening to
EXPOSE 3000

# execute node command to start our application
CMD ["node", "app.mjs"]
