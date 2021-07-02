FROM curlimages/curl:7.77.0

ADD scripts/* /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/send"]
