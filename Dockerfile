FROM ubuntu:14.04
RUN apt-get update; \
    apt-get install -y automake autotools-dev g++ git libcurl4-gnutls-dev libfuse-dev libssl-dev libxml2-dev make pkg-config curl unzip python groff

RUN git clone https://github.com/s3fs-fuse/s3fs-fuse.git
RUN cd s3fs-fuse && ./autogen.sh && ./configure && make && make install

RUN mkdir -p /mnt/s3_mountpoint

RUN curl -o Anaconda3-4.3.0-Linux-x86_64.sh https://repo.continuum.io/archive/Anaconda3-4.3.0-Linux-x86_64.sh
RUN bash Anaconda3-4.3.0-Linux-x86_64.sh -b
RUN rm Anaconda3-4.3.0-Linux-x86_64.sh

COPY startup.sh startup.sh
CMD ["bash", "startup.sh"]

