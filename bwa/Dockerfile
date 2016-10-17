FROM fjukstad/seqbase

USER root
WORKDIR /tools
RUN wget https://github.com/lh3/bwa/archive/0.7.12.zip 
RUN unzip 0.7.12.zip
RUN mv bwa-0.7.12 bwa
WORKDIR bwa
RUN make

USER root

USER worker 
ENTRYPOINT ["/tools/bwa/bwa"]
