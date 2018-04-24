# Here we base from official NodeJS image.
#
#   https://hub.docker.com/_/node/
#
# And inject R as per reference installation notes from the following:
#
#   https://github.com/rocker-org/rocker/blob/master/r-base/Dockerfile
#   https://cran.ms.unimelb.edu.au/bin/linux/debian/
#
# It can also be the other way round, i.e. base from r-base then inject NodeJS.
#

FROM node:8.6.0

# --

RUN apt-get update \ 
    && apt-get install -y --no-install-recommends \
    locales \
    wget \
    fonts-texgyre \
    apt-transport-https \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
     && locale-gen en_US.utf8 \
     && /usr/sbin/update-locale LANG=en_US.UTF-8

RUN echo "deb https://cran.ms.unimelb.edu.au/bin/linux/debian jessie-cran34/" >> /etc/apt/sources.list

RUN apt-key adv --keyserver keys.gnupg.net --recv-key 'E19F5F87128899B192B1A2C2AD5F960A256A04AF'

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    r-base-core r-recommended r-base \
    && rm -rf /var/lib/apt/lists/*

# --

COPY ./attitude.json /app/
COPY ./*.R /app/
COPY ./*.js /app/
COPY ./package*.json /app/

# Needed for TinyTeX
#RUN echo "export PATH="$HOME/bin:$PATH"" >> $HOME/.profile
ENV PATH="/root/bin:${PATH}"

WORKDIR /app

RUN Rscript dependencies.R

# If we also want it for node user
USER node
RUN Rscript -e "tinytex::install_tinytex()"
USER root

COPY latex_deps.sh /root/bin
COPY dependencies.Latex /root/
RUN bash /root/bin/latex_deps.sh /root/dependencies.Latex

RUN npm install

EXPOSE 8888

CMD ["node", "server.js"]