FROM fjukstad/gatk

USER root

RUN apt-get update && apt-get install -y \
	r-base 

# Install Java 1.7 (since MuTect for some reason does not work with 1.8)
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update 
RUN echo "oracle-java7-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN apt install -y oracle-java7-installer

WORKDIR /tools
RUN mkdir mutect
WORKDIR mutect
COPY mutect-1.1.7.jar.zip  mutect-1.1.7.jar.zip 
RUN unzip mutect-1.1.7.jar.zip

USER worker 
ENTRYPOINT ["java", "-jar", "/tools/mutect/mutect-1.1.7.jar"]
