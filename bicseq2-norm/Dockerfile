FROM fjukstad/seqbase

WORKDIR /tools
RUN wget http://compbio.med.harvard.edu/BIC-seq/NBICseq-norm_v0.2.4.tar.gz
RUN tar -xzf NBICseq-norm_v0.2.4.tar.gz 
ENTRYPOINT ["perl", "NBICseq-norm_v0.2.4/NBICseq-norm.pl"]
