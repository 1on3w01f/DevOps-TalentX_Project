FROM nginx
LABEL "Project"="talentx"
LABEL "Author"="Lukman"

RUN rm -rf /etc/nginx/conf.d/default.conf
COPY txapp.conf /etc/nginx/conf.d/txapp.conf