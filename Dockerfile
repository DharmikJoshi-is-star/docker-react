FROM node:alpine

WORKDIR '/app'
COPY package.json .
RUN yarn install
COPY . .
RUN yarn run build


#every thing will be build inside /app/build of container workdirectory
#all the file we have in /app/build copy over our run phase

#start run phase
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
#copy something from  different phase ( 0 is indexed to build phase )
#then specify where to copy from(/app/build) and where to paste(/usr/share/nginx/html)
