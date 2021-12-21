FROM ubuntu:latest

ENV MAIN_FOLDER = /home

RUN apt update 

# Prevent confirm promt add -y flag
# Prevent choice  geographic area
RUN DEBIAN_FRONTEND='noninteractive' apt install nginx npm  curl  -y

# node 14. ( mặc định tải node 10. nó sẽ gây lỗi )
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -

RUN DEBIAN_FRONTEND='noninteractive' apt install nodejs -y




WORKDIR $MAIN_FOLDER

COPY ./ ./


RUN npm install yarn -g


# Yarn tải // nên nhanh hơn npm 
RUN yarn install 
RUN yarn  run build

RUN cp -r build/* /var/www/html/


# chay deamon ko chay dc service nginx start 
CMD ["nginx", "-g", "daemon off;"]
