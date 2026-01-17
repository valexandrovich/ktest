build:
	cd docker && docker compose --env-file ./env/dev/compose.env build
up:
	cd docker && docker compose --env-file ./env/dev/compose.env up -d

down:
	cd docker && docker compose --env-file ./env/dev/compose.env down

logs:
	cd docker && docker compose --env-file ./env/dev/compose.env logs -f

clean:
	cd docker && docker compose --env-file ./env/dev/compose.env down -v
	docker system prune -f
