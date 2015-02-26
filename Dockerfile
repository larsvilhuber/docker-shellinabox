FROM ubuntu:14.04

#######################################################################################

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN groupadd -r shellinabox && useradd -r -g shellinabox shellinabox

RUN apt-get update && apt-get -y install shellinabox ssh

COPY shellinabox_services /shellinabox_services
RUN chmod 600 /shellinabox_services

EXPOSE 4200

#######################################################################################
COPY docker-entrypoint.sh /
COPY docker-command.sh /
RUN chmod +x /docker-entrypoint.sh /docker-command.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/docker-command.sh"]

