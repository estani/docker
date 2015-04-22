FROM java

#RUN curl http://ftp.fau.de/apache/lucene/solr/4.10.3/solr-4.10.3.tgz > solr.tgz
RUN cd /opt && \
    curl http://ftp.fau.de/apache/lucene/solr/4.10.3/solr-4.10.3.tgz | tar zx
RUN ln -s /opt/solr-4.10.3 /solr

#CMD ["/bin/bash", "-c", "/solr/bin/solr -f"]

ENTRYPOINT ["/solr/bin/solr", "-f"]
