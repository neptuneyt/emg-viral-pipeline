FROM continuumio/miniconda3
ENV VERSION 2.7.1

RUN apt-get update && apt install -y procps curl make && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN conda config --add channels conda-forge && \
    conda config --add channels bioconda && \
    conda config --add channels default

RUN conda install krona=$VERSION && conda clean -a

# setup taxonomic index
RUN cd /opt/conda/opt/krona && bash updateTaxonomy.sh