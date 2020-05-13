FROM rocker/verse:latest
ENV VERSION 0.12.3
ENV TOOL sankeyD3

RUN apt update && apt install -y procps wget gzip && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN R -e "install.packages('devtools', dependencies=TRUE, repos = 'http://cran.us.r-project.org')"
RUN R -e 'devtools::install_github("fbreitwieser/sankeyD3")'