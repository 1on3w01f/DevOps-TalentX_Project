FROM nginx
LABEL "Project"="talentx"
LABEL "Author"="Lukman"

RUN rm -rf /etc/nginx/conf.d/default.conf
COPY nginxapp.conf /etc/nginx/conf.d/txapp.conf