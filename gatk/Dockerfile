FROM fjukstad/seqbase
USER root

RUN apt-get update && apt-get install -y \
	r-base 

WORKDIR /tools
RUN mkdir gatk
COPY GenomeAnalysisTK-3.6.tar.bz2 gatk/gatk.tar.bz2
WORKDIR /tools/gatk
RUN tar jxf gatk.tar.bz2 

USER worker 
ENTRYPOINT ["java", "-jar", "/tools/gatk/GenomeAnalysisTK.jar"]
