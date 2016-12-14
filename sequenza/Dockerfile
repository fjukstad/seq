FROM fjukstad/samtools

USER root 

RUN apt-get update 
RUN apt-get install -y \
    python 

WORKDIR /tools
RUN wget https://cran.r-project.org/src/contrib/sequenza_2.1.2.tar.gz
RUN tar -xzf sequenza_2.1.2.tar.gz
USER worker 

ENTRYPOINT ["python", "/tools/sequenza/exec/sequenza-utils.py"]
