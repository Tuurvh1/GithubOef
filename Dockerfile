### DEEL 1: instructies voor het BUILDen van de IMAGE 
FROM ubuntu:20.04
# We starten vanaf de bestaande “ubuntu”-image (tag: 20.04) # deze image wordt van de registry (Docker Hub) gehaald.
RUN apt update 
RUN apt install -y apache2 

ENV DEBIAN_FRONTEND=noninteractive 
# Bovenstaande lijn is nodig omdat er anders naar de timezone gevraagd wordt 
# tijdens de installatie van PHP 
RUN apt install -y php

COPY www /var/www/html/ 
# Kopieer de inhoud van “www” (op de host) 
# naar “/var/www/html” (in de image).

### DEEL 2: extra details voor bij het RUNNEN van een CONTAINER

WORKDIR /var/www/html/
# Directory waar je terecht komt als je inlogt op een draaiende container

EXPOSE 80/tcp
# Binnen deze image/container zal poort 80 (over TCP) gebruikt worden
