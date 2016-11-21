FROM fjukstad/gatk

USER root

RUN apt-get update && apt-get install -y \
	r-base 

WORKDIR /tools
RUN mkdir mutect
WORKDIR mutect
COPY mutect-1.1.7.jar.zip  mutect-1.1.7.jar.zip 
RUN unzip mutect-1.1.7.jar.zip

USER worker 
# ENTRYPOINT ["java", "-jar", "/tools/mutect/mutect-1.1.7.jar"]
