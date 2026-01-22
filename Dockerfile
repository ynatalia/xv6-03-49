# /* an edited Dockerfile. Natala Yarokh, 327047049*/
FROM ubuntu:16.04

# add from local directory
ADD ./xv6-01 /xv6-01
RUN apt-get -qq update && \
# --no-install-recommends reduces the Image size by almost 15%,
# but in our case git needs --reinstall ca-certificates to work 
    apt-get install -y \
                    git \
                    make \
                    qemu-system \
                    gcc-multilib \


# put dependencies here by the same way as git
                    
                    
                    
    &&chmod +x xv6-01/*.pl \
#    &&chmod +x xv6-11/*.pl \
####
#    5 lines for general cleanning, -15% in size  
    &&apt-get purge -qq git \
    &&apt-get autoremove --purge -qq \
    &&apt-get clean -qq &&rm -rf /var/lib/apt/lists/* \
    &&rm -rf /tmp/* /var/tmp/* \
    &&rm -rf /usr/share/man/* /usr/share/doc/*

WORKDIR /xv6-01
#WORKDIR /xv6-11

CMD ["/bin/bash"]

