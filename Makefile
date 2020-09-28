CONTAINER_NAME := web-security_revealjs_1
run:
	docker-compose up -d

start: run
	sleep 3
	open http://localhost:8000

stop:
	docker-compose down

build: run
	# docker-compose run --rm revealjs build
	@for directory in css js lib index.html ; do \
		docker container cp ${CONTAINER_NAME}:/reveal.js/$$directory ./docs; \
	done