FROM fjukstad/seqbase 

USER root
WORKDIR /tools
RUN mkdir fastx_toolkit
RUN wget http://hannonlab.cshl.edu/fastx_toolkit/fastx_toolkit_0.0.13_binaries_Linux_2.6_amd64.tar.bz2
RUN tar xvjf fastx_toolkit_0.0.13_binaries_Linux_2.6_amd64.tar.bz2 -C fastx_toolkit
RUN chmod +x fastx_toolkit/bin/*
RUN ln -s /tools/fastx_toolkit/bin/* /usr/local/bin/
