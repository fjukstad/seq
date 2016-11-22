FROM fjukstad/samtools

USER root
RUN apt-get update && apt-get -y upgrade

RUN apt-get install -y\
    python \
    python-pip

RUN pip install --upgrade pip

RUN pip install pysam==0.8.4 
RUN pip install numpy \
                tables \
                pysamstats

USER worker 

ENTRYPOINT ["pysamstats"]
