FROM fjukstad/seqbase

USER root
WORKDIR /tools
RUN mkdir picard
WORKDIR picard
RUN wget https://github.com/broadinstitute/picard/releases/download/2.6.0/picard.jar

USER worker 
ENTRYPOINT ["java", "-jar", "/tools/picard/picard.jar"]
