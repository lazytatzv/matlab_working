.PHONY: dev ps

dev:
	docker compose exec matlab bash

ps:
	docker compose ps

