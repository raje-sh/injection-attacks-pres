CONTAINER_NAME := web-security_revealjs_1

start:
	docker-compose up -d
	sleep 3
	open http://localhost:8000
stop:
	docker-compose down
build:
	# docker-compose run --rm revealjs build
	@for directory in css js lib index.html ; do \
		docker container cp ${CONTAINER_NAME}:/reveal.js/$$directory ./docs; \
	done