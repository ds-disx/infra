start-db:
	docker compose -f docker-compose-dev.yml up -d

stop-db:
	docker compose -f docker-compose-dev.yml down

start-post:
	cd .. && cd post-service && quarkus dev

stop-post:
	pkill java &

start-frontend:
	cd .. && cd frontend && yarn dev

stop-frontend:
	pkill next-serv &

start-gateway:
	nginx -p ./ -c nginx-dev.conf

stop-gateway: 
	pkill nginx &

start-all:
	docker compose -f docker-compose-dev.yml up -d
	cd .. & cd post-service && quarkus dev &
	cd .. & cd frontend && yarn dev &

stop-all: stop-db stop-post stop-frontend