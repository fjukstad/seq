FROM etal/cnvkit

RUN groupadd -g 1001 workergroup 
RUN useradd -g 1001 -u 1000 -p $(openssl passwd -1 worker) worker
RUN mkdir /home/worker
WORKDIR /home/worker
RUN chown worker:workergroup /home/worker 

USER worker 

ENTRYPOINT ["cnvkit.py"]
