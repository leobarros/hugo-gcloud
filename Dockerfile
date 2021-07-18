FROM alpine:3.8
ARG CLOUD_SDK_VERSION=348.0.0
ENV CLOUD_SDK_VERSION=$CLOUD_SDK_VERSION
ENV PATH /google-cloud-sdk/bin:$PATH
ENV HUGO_VERSION=0.85.0
RUN apk --no-cache add \
        wget \
        python \
        py-pygments \
        bash \
        tar \
        wget \
    && wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    tar xzf google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    rm google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    ln -s /lib /lib64 && \
    gcloud config set core/disable_usage_reporting true && \
    gcloud --version
RUN mkdir -pv /usr/local/hugo && \
    wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz -O /usr/local/hugo/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    tar xzf /usr/local/hugo/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz -C /usr/local/hugo/ && \
    ln -s /usr/local/hugo/hugo /usr/local/bin/hugo && \
    rm /usr/local/hugo/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz
VOLUME ["/root/.config"]
EXPOSE 1313
CMD hugo version