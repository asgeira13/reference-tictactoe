FROM node
MAINTAINER Asgeir Atlason "asgeira13@ru.is"
WORKDIR /code
COPY package.json .
COPY migratescript.sh .
COPY /build /code
RUN npm install --silent
RUN export NODE_PATH=.
RUN ls
RUN pwd
RUN chmod u+x ./migratescript.sh
ENV NODE_PATH .
EXPOSE 3000
