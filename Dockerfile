FROM ubuntu:16.10

# Install Pachyderm and its dependencies
RUN \
  apt-get update -yq && \
  apt-get install -yq --no-install-recommends \
    git \
    ca-certificates \
    curl \
    fuse && \
  apt-get clean && \
  rm -rf /var/lib/apt

# Install Go 1.6.0 (if you don't already have it in your base image)
RUN \
  curl -sSL https://storage.googleapis.com/golang/go1.6.linux-amd64.tar.gz | tar -C /usr/local -xz && \
  mkdir -p /go/bin
ENV PATH /usr/local/go/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin
ENV GOPATH /go
ENV GOROOT /usr/local/go

# Install Pachyderm job-shim
RUN go get github.com/pachyderm/pachyderm && \
    go get github.com/pachyderm/pachyderm/src/server/cmd/job-shim && \
    cp $GOPATH/bin/job-shim /job-shim

RUN apt-get update 

# Now the rest for our pipeline 
RUN apt-get install -y \
        build-essential \
        zlib1g-dev \
        libncurses5-dev \
        default-jre \
        wget \ 
        unzip

RUN mkdir /tools
WORKDIR /tools

RUN wget https://github.com/lh3/bwa/archive/0.7.12.zip 
RUN unzip 0.7.12.zip
RUN mv bwa-0.7.12 bwa
WORKDIR bwa
RUN make
ENV PATH="/tools/bwa:${PATH}"

WORKDIR /tools
RUN wget https://root.cern.ch/download/root_v6.06.08.Linux-ubuntu14-x86_64-gcc4.8.tar.gz
RUN tar -xzf root_v6.06.08.Linux-ubuntu14-x86_64-gcc4.8.tar.gz
ENV ROOTSYS="/tools/root"
ENV LD_LIBRARY_PATH="/tools/root/lib"

WORKDIR /tools
RUN mkdir picard
WORKDIR picard
RUN wget https://github.com/broadinstitute/picard/releases/download/2.6.0/picard.jar

WORKDIR /tools
RUN wget http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.5.zip
RUN unzip fastqc_v0.11.5.zip
RUN mv FastQC fastqc 
RUN chmod +x fastqc/fastqc

WORKDIR /tools
RUN wget http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.36.zip
RUN unzip Trimmomatic-0.36
RUN mv Trimmomatic-0.36 trimmomatic

RUN rm *.zip *.gz 

# Set up worker user 
RUN groupadd -g 1001 workergroup 
RUN useradd -g 1001 -u 1000 -p $(openssl passwd -1 worker) worker
RUN mkdir /home/worker
WORKDIR /home/worker
RUN chown worker:workergroup /home/worker 
RUN chown -R worker:workergroup /tools

# link up everything and add to path
RUN ln -s /tools/fastqc/fastqc /usr/local/bin/fastqc
USER worker 
RUN echo "PATH=/tools/bwa:/tools/fastqc/:$PATH" >> .bashrc
