FROM node:8-alpine
MAINTAINER Jessica Smith <jessica.smith@fasthosts.com>
MAINTAINER Nicolas Truyens <nicolas@truyens.com>

COPY files /
RUN \
	npm install -g laravel-echo-server && \
	cd /opt/laravel-echo-server && \
	chmod +x entrypoint.sh

EXPOSE 6001
ENV \
	ECHO_AUTH_HOST=http://localhost \
	ECHO_AUTH_ENDPOINT=/broadcasting/auth \
	ECHO_HOST=null \
	ECHO_PORT=6001 \
	ECHO_SSL_CERT_PATH= \
	ECHO_SSL_KEY_PATH= \
	ECHO_SSL_CHAIN_PATH= \
	ECHO_SSL_PASSPHRASE= \
	ECHO_PROTOCOL=http \
	ECHO_REDIS_PORT=6379 \
	ECHO_REDIS_HOSTNAME=redis \
	ECHO_REDIS_DB=0 \
	ECHO_REDIS_PASSWORD= \
	ECHO_REDIS_PREFIX= \	
	ECHO_DEVMODE=false \
	ECHO_CLIENTS=[] \
	ECHO_ALLOW_CORS=true \
	ECHO_ALLOW_ORIGIN=http://localhost:80 \
	ECHO_ALLOW_METHODS="GET, POST" \
	ECHO_ALLOW_HEADERS="Origin, Content-Type, X-Auth-Token, X-Requested-With, Accept, Authorization, X-CSRF-TOKEN, X-Socket-Id"

WORKDIR /opt/laravel-echo-server
ENTRYPOINT ["/opt/laravel-echo-server/entrypoint.sh"]
CMD ["laravel-echo-server", "start"]