start-db:
	docker compose -f docker-compose-dev.yml up -d

stop-db:
	docker compose -f docker-compose-dev.yml down

start-disx:
	cd .. && cd disx-service && quarkus dev

stop-disx:
	kill -9 `sudo lsof -t -i:3010`   

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
	cd .. & cd disx-service && quarkus dev &
	cd .. & cd frontend && yarn dev &

stop-all: stop-db stop-disx stop-frontend