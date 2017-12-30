FROM pdal/dependencies

MAINTAINER John Wass <jwass3@gmail.com>

ENV PDAL_BUILDER_VERSION 0.1

LABEL io.k8s.description="Platform for building PDAL Pipelines and Applications" \
      io.k8s.display-name="PDAL Builder" \
      io.openshift.tags="builder,PDAL"

RUN git clone https://github.com/PDAL/PDAL

COPY build.sh /tmp

RUN cd PDAL\
 && /tmp/build.sh

COPY s2i/bin/ /usr/libexec/s2i

RUN mkdir /opt/app-root \
 && chown -R 1001:1001 /opt/app-root

COPY purge.sh /tmp

RUN /tmp/purge.sh \
 && rm -rf /tmp/*

USER 1001

CMD ["/usr/libexec/s2i/usage"]
