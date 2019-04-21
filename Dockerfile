FROM toyokappa/aws-deployer-docker

# ruby install
RUN curl -O http://ftp.ruby-lang.org/pub/ruby/2.5/ruby-2.5.3.tar.gz && \
    tar -zxvf ruby-2.5.3.tar.gz && \
    cd ruby-2.5.3 && \
    ./configure --disable-install-doc && \
    make && \
    make install && \
    cd .. && \
    rm -r ruby-2.5.3 ruby-2.5.3.tar.gz

RUN gem install bundler

RUN set -ex \
    && apt-get update  \
    && apt-get install -y \
      mysql-client \
      --no-install-recommends  \
    && rm -rf /var/lib/apt/lists/*

