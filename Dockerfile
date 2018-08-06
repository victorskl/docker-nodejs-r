FROM r-base:3.5.1

#--

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    curl gfortran pandoc libssl-dev libgit2-dev libxml2-dev git \
    && rm -rf /var/lib/apt/lists/*

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

RUN /bin/bash -c 'source $HOME/.bashrc; nvm install 8.6.0'

#--

COPY ./attitude.json /app/
COPY ./*.R /app/
COPY ./*.Rmd /app/
COPY ./*.js /app/
COPY ./package*.json /app/

# Needed for TinyTeX
#RUN echo "export PATH="$HOME/bin:$PATH"" >> $HOME/.profile
ENV PATH="/root/bin:${PATH}"

WORKDIR /app

RUN Rscript dependencies.R

# Or we could also run like this as well:
RUN Rscript -e "tinytex::install_tinytex(repository = 'http://mirrors.rit.edu/CTAN/systems/texlive/tlnet/')"

COPY latex_deps.sh /root/bin
COPY dependencies.Latex /root/

# Let keep it continue building image, if tlmgr install latex package if not found
RUN bash /root/bin/latex_deps.sh /root/dependencies.Latex; exit 0

RUN /bin/bash -c 'source $HOME/.bashrc; npm install'

EXPOSE 8888

#CMD ["node", "server.js"]
CMD /bin/bash -c 'source $HOME/.bashrc; node server.js'