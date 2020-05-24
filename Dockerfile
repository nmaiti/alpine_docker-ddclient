FROM alpine:latest

RUN apk add --no-cache \
	perl \
	perl-digest-sha1 \
	perl-io-socket-ssl \
	perl-io-socket-inet6 \
	perl-json

RUN mkdir -p /etc/ddclient/ \
	&& mkdir -p /var/cache/ddclient/

RUN apk add --no-cache --virtual=builddeps curl wget make \
	&& curl -L http://cpanmin.us | perl - App::cpanminus \
	&& cpanm Data::Validate::IP JSON::Any \
	&& rm -rf /config/.cpanm /root/.cpanm /usr/local/bin/cpanm \
	&& DDCLIENT_VERSION=$(curl -sX GET "https://api.github.com/repos/ddclient/ddclient/releases/latest" \
	| awk '/tag_name/{print $4;exit}' FS='[""]') \
	&& echo "DDCLIENT_VERSION=${DDCLIENT_VERSION}" \
	&& curl -o /root/ddclient.tar.gz -L \
	"https://github.com/ddclient/ddclient/archive/${DDCLIENT_VERSION}.tar.gz" \
	&& cd /root \
	&& tar xf ddclient.tar.gz \
	&& cd ddclient* \
	&& cp ddclient /usr/bin/ddclient \
	&& cp sample-etc_ddclient.conf /etc/ddclient/ddclient.conf.original && \
	apk del --purge --rdepends builddeps

VOLUME [ "/client/" ]

COPY run.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
