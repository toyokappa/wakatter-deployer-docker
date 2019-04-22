FROM toyokappa/aws-deployer-docker

ENV BUNDLER_VERSION=2.0.1

# ruby install
RUN curl -O http://ftp.ruby-lang.org/pub/ruby/2.5/ruby-2.5.3.tar.gz && \
    tar -zxvf ruby-2.5.3.tar.gz && \
    cd ruby-2.5.3 && \
    ./configure --disable-install-doc && \
    make && \
    make install && \
    cd .. && \
    rm -r ruby-2.5.3 ruby-2.5.3.tar.gz

RUN gem update --system
RUN gem uninstall bundler
RUN rm /usr/local/bin/bundle
RUN rm /usr/local/bin/bundler
RUN gem install bundler

RUN set -ex && \
    echo "deb http://deb.debian.org/debian jessie main" > /etc/apt/sources.list && \
    echo "deb http://security.debian.org jessie/updates main" >> /etc/apt/sources.list && \
    apt-get update &&  \
    apt-get install -y mysql-client --no-install-recommends &&  \
    rm -rf /var/lib/apt/lists/*

