FROM nginx:latest
LABEL mainteiner="frostdimonlex@gmail.com"
WORKDIR usr/share/nginx/html
ENV NAME=DIMA
ENV AGE=27
RUN rm index.html && touch index.html && echo "My name is $NAME and I am $AGE years old." > index.html



