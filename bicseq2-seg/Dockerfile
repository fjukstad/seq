FROM fjukstad/seqbase

WORKDIR /tools
RUN wget http://www.math.pku.edu.cn/teachers/xirb/downloads/software/BICseq2/BICseq2/NBICseq-seg_v0.7.2.tar.gz
RUN wget http://compbio.med.harvard.edu/BIC-seq/NBICseq-norm_v0.2.4.tar.gz
RUN tar -xzf NBICseq-seg_v0.7.2.tar.gz
ENTRYPOINT ["perl", "NBICseq-seg_v0.7.2/NBICseq-seg.pl"]
