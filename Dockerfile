FROM centos:latest

# Install JQ
RUN curl -L https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 > /usr/bin/jq && \
    chmod +x /usr/bin/jq

# Install YQ
RUN curl -L https://github.com/mikefarah/yq/releases/download/2.4.0/yq_linux_amd64 > /usr/bin/yq && \
    chmod +x /usr/bin/yq

# Install Node and NPM
RUN cd /opt && \
    curl -L -O https://nodejs.org/dist/v10.16.0/node-v10.16.0-linux-x64.tar.xz && \
    tar xf node-v10.16.0-linux-x64.tar.xz && \
    rm -f node-v10.16.0-linux-x64.tar.xz

# Add Node and NPM to PATH
ENV PATH=$PATH:/opt/node-v10.16.0-linux-x64/bin
