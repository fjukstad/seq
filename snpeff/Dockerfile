FROM fjukstad/gatk

USER root
WORKDIR /tools

RUN wget http://downloads.sourceforge.net/project/snpeff/snpEff_latest_core.zip
RUN unzip snpEff_latest_core.zip
RUN rm /tools/snpEff_latest_core.zip

RUN chmod -R o+rwx /tools/snpEff

USER worker 
ENTRYPOINT ["java","-jar", "/tools/snpEff/snpEff.jar"]
